package resource_test

import (
	"encoding/json"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	. "github.com/concourse/dutyfree/resource"
)

var _ = Describe("Resource model", func() {
	Context("json unmarshal", func() {
		It("is able to unmarshal json into type resource", func() {
			var resource Resource

			jsonResource := `{
				"name": "test",
				"repo": "https://github.com/concourse/test",
				"description": "test description",
				"stars": "8K",
				"stars_count": 8040,
				"host": "github"
			}`
			err := json.Unmarshal([]byte(jsonResource), &resource)
			Expect(err).NotTo(HaveOccurred())
			Expect(resource.Name).To(Equal("test"))
			Expect(resource.URL).To(Equal("https://github.com/concourse/test"))
			Expect(resource.Description).To(Equal("test description"))
			Expect(resource.Stars).To(Equal("8K"))
			Expect(resource.StarsCount).To(Equal(8040))
			Expect(resource.Host).To(Equal("github"))
		})
	})
})
