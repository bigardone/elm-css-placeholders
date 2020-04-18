module Placeholders.Square exposing
    ( Square, default
    , view
    )

{-| Renders a square placeholder.


# Definition

@docs Square, default


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a square placeholder
-}
type alias Square =
    { backgroundColor : Css.Color
    , borderRadius : Css.Px
    , size : Css.Px
    }


{-| Returns a default configuration for a square placeholder.
-}
default : Square
default =
    { backgroundColor = Css.rgba 0 0 0 0.3
    , borderRadius = Css.px 4
    , size = Css.px 100
    }


{-| Renders a square placeholder using the given configuration.
-}
view : Square -> Html msg
view { backgroundColor, borderRadius, size } =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height size
            , Css.width size
            , Css.borderRadius borderRadius
            ]
        ]
        []
