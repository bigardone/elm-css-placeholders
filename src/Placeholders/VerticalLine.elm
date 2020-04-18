module Placeholders.VerticalLine exposing
    ( VerticalLine
    , default
    , view
    )

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a vertical line placeholder
-}
type alias VerticalLine =
    { backgroundColor : Css.Color
    }


{-| Returns a default configuration for a vertical line placeholder.
-}
default : VerticalLine
default =
    { backgroundColor = Css.rgba 0 0 0 0.3
    }


{-| Renders a vertical line placeholder using the given configuration.
-}
view : VerticalLine -> Html msg
view { backgroundColor } =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height <| Css.pct 100
            , Css.width <| Css.px 1
            ]
        ]
        []

