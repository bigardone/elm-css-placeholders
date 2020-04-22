module Placeholders.Circle exposing
    ( Circle, default, withBackgroundColor, withSize
    , view
    )

{-| Renders a circle placeholder.


# Definition

@docs Circle, default, withBackgroundColor, withSize


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a circle placeholder
-}
type Circle
    = Circle
        { backgroundColor : Css.Color
        , size : Css.Px
        }


{-| Returns a default configuration for a circle placeholder.
-}
default : Circle
default =
    Circle
        { backgroundColor = Css.rgba 0 0 0 0.3
        , size = Css.px 100
        }


{-| Adds `backgroundColor` to a `Circle`.
-}
withBackgroundColor : Css.Color -> Circle -> Circle
withBackgroundColor color (Circle circle) =
    Circle { circle | backgroundColor = color }


{-| Adds `size` to a `Circle`.
-}
withSize : Css.Px -> Circle -> Circle
withSize size (Circle circle) =
    Circle { circle | size = size }


{-| Renders a circle placeholder using the given configuration.
-}
view : Circle -> Html msg
view (Circle { backgroundColor, size }) =
    Html.div
        [ Html.class "placeholder-circle"
        , Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height size
            , Css.width size
            , Css.borderRadius <| Css.pct 50
            ]
        ]
        []
