module Common.Common exposing
    ( RGB
    , ResourceType
    , Shadow
    , bannerBackgroundColor
    , capitalize
    , cardDescriptionColor
    , cardTitleColor
    , center
    , footerBackgroundColor
    , gridSize
    , hostPillDarkBackgroundColor
    , hostPillLightBackgroundColor
    , shadowColor
    , termsLinkColor
    , white
    )

import Element exposing (Attribute, htmlAttribute)
import Html.Attributes exposing (style)



-- TYPES


type alias RGB =
    { red : Int
    , green : Int
    , blue : Int
    , alpha : Float
    }


type alias Shadow =
    { offset : ( Float, Float )
    , blur : Float
    , size : Float
    , color : RGB
    }


type alias ResourceType =
    { name : String
    , url : String
    , description : String
    , username : String
    , stars : String
    , host : String
    }



-- UNITS


gridSize : Int
gridSize =
    8



-- STYLING


center : Attribute msg
center =
    htmlAttribute (Html.Attributes.style "margin" "0 auto")



-- COLORS


bannerBackgroundColor : RGB
bannerBackgroundColor =
    { red = 42, green = 50, blue = 57, alpha = 1 }


white : RGB
white =
    { red = 255, green = 255, blue = 255, alpha = 1 }


shadowColor : RGB
shadowColor =
    { red = 98, green = 85, blue = 85, alpha = 0.2 }


cardDescriptionColor : RGB
cardDescriptionColor =
    { red = 90, green = 85, blue = 85, alpha = 1 }


cardTitleColor : RGB
cardTitleColor =
    { red = 42, green = 41, blue = 41, alpha = 1 }


footerBackgroundColor : RGB
footerBackgroundColor =
    { red = 127, green = 127, blue = 127, alpha = 1 }


termsLinkColor : RGB
termsLinkColor =
    { red = 12, green = 106, blue = 246, alpha = 1 }


hostPillLightBackgroundColor : RGB
hostPillLightBackgroundColor =
    { red = 242, green = 242, blue = 242, alpha = 0.56 }


hostPillDarkBackgroundColor : RGB
hostPillDarkBackgroundColor =
    { red = 235, green = 235, blue = 235, alpha = 1 }



-- HELPERS


capitalize : String -> String
capitalize s =
    (String.left 1 s |> String.toUpper) ++ String.dropLeft 1 s
