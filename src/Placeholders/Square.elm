module Placeholders.Square exposing
    ( Square, default, withBackgroundColor, withSize
    , view
    )

{-| Renders a square placeholder.


# Definition

@docs Square, default, withBackgroundColor, withSize


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a square placeholder
-}
type Square
    = Square
        { backgroundColor : Css.Color
        , borderRadius : Css.Px
        , size : Css.Px
        }


{-| Returns a default configuration for a square placeholder.
-}
default : Square
default =
    Square
        { backgroundColor = Css.rgba 0 0 0 0.3
        , borderRadius = Css.px 4
        , size = Css.px 100
        }


{-| Adds `backgroundColor` to a `Square`.
-}
withBackgroundColor : Css.Color -> Square -> Square
withBackgroundColor color (Square square) =
    Square { square | backgroundColor = color }


{-| Adds `size` to a `Square`.
-}
withSize : Css.Px -> Square -> Square
withSize size (Square square) =
    Square { square | size = size }


{-| Renders a square placeholder using the given configuration.
-}
view : Square -> Html msg
view (Square { backgroundColor, borderRadius, size }) =
    Html.div
        [ Html.class "placeholder-square"
        , Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height size
            , Css.width size
            , Css.borderRadius borderRadius
            ]
        ]
        []
