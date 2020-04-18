module Placeholders.Circle exposing
    ( Circle, default
    , view
    )

{-| Renders a circle placeholder.


# Definition

@docs Circle, default


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a circle placeholder
-}
type alias Circle =
    { backgroundColor : Css.Color
    , size : Css.Px
    }


{-| Returns a default configuration for a circle placeholder.
-}
default : Circle
default =
    { backgroundColor = Css.rgba 0 0 0 0.3
    , size = Css.px 100
    }


{-| Renders a circle placeholder using the given configuration.
-}
view : Circle -> Html msg
view { backgroundColor, size } =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height size
            , Css.width size
            , Css.borderRadius <| Css.pct 50
            ]
        ]
        []
