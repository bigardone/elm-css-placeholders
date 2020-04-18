module Placeholders.Line exposing
    ( Line
    , default
    , view
    )

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a line placeholder
-}
type alias Line =
    { backgroundColor : Css.Color
    }


{-| Returns a default configuration for a line placeholder.
-}
default : Line
default =
    { backgroundColor = Css.rgba 0 0 0 0.3
    }


{-| Renders a line placeholder using the given configuration.
-}
view : Line -> Html msg
view { backgroundColor } =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height <| Css.px 1
            , Css.width <| Css.pct 100
            ]
        ]
        []

