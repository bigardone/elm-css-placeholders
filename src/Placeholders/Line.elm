module Placeholders.Line exposing
    ( Line, default, withBackgroundColor
    , view
    )

{-| Renders a line placeholder.


# Definition

@docs Line, default, withBackgroundColor


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a line placeholder
-}
type Line
    = Line
        { backgroundColor : Css.Color
        }


{-| Returns a default configuration for a line placeholder.
-}
default : Line
default =
    Line
        { backgroundColor = Css.rgba 0 0 0 0.3 }


{-| Adds `backgroundColor` to a `Line`.
-}
withBackgroundColor : Css.Color -> Line -> Line
withBackgroundColor color (Line line) =
    Line { line | backgroundColor = color }


{-| Renders a line placeholder using the given configuration.
-}
view : Line -> Html msg
view (Line { backgroundColor }) =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height <| Css.px 1
            , Css.width <| Css.pct 100
            ]
        ]
        []
