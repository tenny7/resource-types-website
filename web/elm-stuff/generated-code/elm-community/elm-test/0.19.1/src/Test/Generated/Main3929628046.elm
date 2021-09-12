module Test.Generated.Main3929628046 exposing (main)

import Terms.TermsTests
import ResourceList.ResourceListTests
import MainTests
import Card.CardStyleTests
import Footer.FooterTests
import Card.CardTests
import Banner.BannerTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Terms.TermsTests" [Terms.TermsTests.suite],     Test.describe "ResourceList.ResourceListTests" [ResourceList.ResourceListTests.suite],     Test.describe "MainTests" [MainTests.suite],     Test.describe "Card.CardStyleTests" [Card.CardStyleTests.suite],     Test.describe "Footer.FooterTests" [Footer.FooterTests.suite],     Test.describe "Card.CardTests" [Card.CardTests.suite],     Test.describe "Banner.BannerTests" [Banner.BannerTests.suite] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 694773936775, processes = 2, paths = ["/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/Banner/BannerTests.elm","/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/Card/CardStyleTests.elm","/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/Card/CardTests.elm","/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/Footer/FooterTests.elm","/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/MainTests.elm","/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/ResourceList/ResourceListTests.elm","/home/runner/work/resource-types-website/resource-types-website/warehouse/web/tests/Terms/TermsTests.elm"]}