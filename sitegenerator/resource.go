package sitegenerator

import (
	"errors"
	"fmt"
	"html/template"
	"io/ioutil"
	"net/http"
	"strings"
)

type Resource struct {
	Name       string `yaml:"name"`
	Repository string `yaml:"repository"`
}

type ResourceModel struct {
	Resource
	Repo              string
	Identifier        string
	AuthorHandle      string
	AuthorProfileLink string
	Readme            template.HTML
}

type ReadmeClient interface {
	Get(authorHandle, repo string) (template.HTML, error)
}

type HttpReadmeClient struct {
	GetReadme func(url string) (*http.Response, error)
}

func (hrc HttpReadmeClient) Get(authorHandle, repo string) (template.HTML, error) {
	readmeURL := fmt.Sprintf("https://api.github.com/repos/%s/%s/readme", authorHandle, repo)
	resp, err := hrc.GetReadme(readmeURL)
	if err != nil {
		return "", err
	}
	if resp.StatusCode != 200 {
		return "", errors.New(fmt.Sprintf("Unable to access ReadMe for in [%s] [%s] due to Status Code [%d]", authorHandle, repo, resp.StatusCode))
	}
	defer resp.Body.Close()
	body, _ := ioutil.ReadAll(resp.Body)
	return template.HTML(body), nil
}

func Enrich(resources []Resource, readmeClient ReadmeClient) ([]ResourceModel, error) {
	var resourceModels []ResourceModel

	for _, resource := range resources {
		resourceModel := ResourceModel{Resource: resource}

		// Here happens the Enrichment
		segmentsAll := strings.Split(resource.Repository, "/")

		if len(segmentsAll) < 5 || segmentsAll[0] != "https:" || segmentsAll[2] != "github.com" {
			return resourceModels, fmt.Errorf("invalid repository for the resource (%s)", resource.Name)
		}

		segments := segmentsAll[3:]

		resourceModel.Repo = segmentsAll[4]
		resourceModel.Identifier = strings.Join(segments, "-")
		resourceModel.AuthorHandle = segmentsAll[3]
		resourceModel.AuthorProfileLink = strings.Join(segmentsAll[:4], "/")
		readme, err := readmeClient.Get(resourceModel.AuthorHandle, resourceModel.Repo)
		if err != nil {
			return resourceModels, err
		}
		resourceModel.Readme = readme

		resourceModels = append(resourceModels, resourceModel)
	}
	return resourceModels, nil
}