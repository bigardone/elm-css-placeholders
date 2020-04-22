module Placeholders.VerticalLine exposing
    ( VerticalLine, default, withBackgroundColor
    , view
    )

{-| Renders a vertical line placeholder.


# Definition

@docs VerticalLine, default, withBackgroundColor


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a vertical line placeholder
-}
type VerticalLine
    = VerticalLine
        { backgroundColor : Css.Color
        }


{-| Adds `backgroundColor` to a `VerticalLine`.
-}
withBackgroundColor : Css.Color -> VerticalLine -> VerticalLine
withBackgroundColor color (VerticalLine verticalLine) =
    VerticalLine { verticalLine | backgroundColor = color }


{-| Returns a default configuration for a vertical line placeholder.
-}
default : VerticalLine
default =
    VerticalLine
        { backgroundColor = Css.rgba 0 0 0 0.3
        }


{-| Renders a vertical line placeholder using the given configuration.
-}
view : VerticalLine -> Html msg
view (VerticalLine { backgroundColor }) =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height <| Css.pct 100
            , Css.width <| Css.px 1
            ]
        ]
        []
