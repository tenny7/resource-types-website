module Banner.BannerTests exposing (..)

import Banner.Banner as Banner exposing (..)
import Banner.Styles as Styles exposing (..)
import Expect exposing (equal)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Banner Component"
        [ describe "container"
            [ test "has height" <|
                \_ ->
                    bannerContainer.height
                        |> Expect.equal 192
            , test "has background color" <|
                \_ ->
                    bannerContainer.backgroundColor
                        |> Expect.equal Styles.backgroundColor
            ]
        , describe "title"
            [ test "has font size" <|
                \_ ->
                    bannerTitle.size
                        |> Expect.equal Styles.titleSize
            , test "has font color" <|
                \_ ->
                    bannerTitle.color
                        |> Expect.equal Styles.titleColor
            , test "has text" <|
                \_ ->
                    bannerTitle.text
                        |> Expect.equal "Resource Types"
            , test "has a font" <|
                \_ ->
                    bannerTitle.font
                        |> Expect.equal Styles.titleFont
            , test "has line height" <|
                \_ ->
                    bannerTitle.lineHeight
                        |> Expect.equal Styles.titleLineHeight
            , test "has top padding" <|
                \_ ->
                    bannerTitle.paddingTop
                        |> Expect.equal Styles.titlePaddingTop
            , test "has bottom padding" <|
                \_ ->
                    bannerTitle.paddingBottom
                        |> Expect.equal Styles.titlePaddingBottom
            ]
        , describe "body"
            [ test "has font size" <|
                \_ ->
                    bannerBody.size
                        |> Expect.equal Styles.bodySize
            , test "has font color" <|
                \_ ->
                    bannerBody.color
                        |> Expect.equal Styles.bodyColor
            , test "has text" <|
                \_ ->
                    bannerBody.text
                        |> Expect.equal "Find more things for your thing-doer to do"
            , test "has a font" <|
                \_ ->
                    bannerBody.font
                        |> Expect.equal Styles.bodyFont
            , test "has a width" <|
                \_ ->
                    bannerBody.width
                        |> Expect.equal Styles.bodyWidth
            ]
        ]


bannerContainer =
    Banner.container


bannerTitle =
    Banner.title


bannerBody =
    Banner.body
