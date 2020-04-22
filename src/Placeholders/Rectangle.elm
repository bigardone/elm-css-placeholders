module Placeholders.Rectangle exposing
    ( Rectangle, default, withBackgroundColor, withBorderRadius, withHeight, withWidth
    , view
    )

{-| Renders a rectangle placeholder.


# Definition

@docs Rectangle, default, withBackgroundColor, withBorderRadius, withHeight, withWidth


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a rectangle placeholder
-}
type Rectangle
    = Rectangle
        { backgroundColor : Css.Color
        , borderRadius : Css.Px
        , height : Css.Px
        , width : Css.Pct
        }


{-| Returns a default configuration for a rectangle placeholder.
-}
default : Rectangle
default =
    Rectangle
        { backgroundColor = Css.rgba 0 0 0 0.3
        , borderRadius = Css.px 4
        , height = Css.px 100
        , width = Css.pct 100
        }


{-| Adds `backgroundColor` to a `Rectangle`.
-}
withBackgroundColor : Css.Color -> Rectangle -> Rectangle
withBackgroundColor color (Rectangle rectangle) =
    Rectangle { rectangle | backgroundColor = color }


{-| Adds `borderRadius` to a `Rectangle`.
-}
withBorderRadius : Css.Px -> Rectangle -> Rectangle
withBorderRadius borderRadius (Rectangle rectangle) =
    Rectangle { rectangle | borderRadius = borderRadius }


{-| Adds `height` to a `Rectangle`.
-}
withHeight : Css.Px -> Rectangle -> Rectangle
withHeight height (Rectangle rectangle) =
    Rectangle { rectangle | height = height }


{-| Adds `width` to a `Rectangle`.
-}
withWidth : Css.Pct -> Rectangle -> Rectangle
withWidth width (Rectangle rectangle) =
    Rectangle { rectangle | width = width }


{-| Renders a rectangle placeholder using the given configuration.
-}
view : Rectangle -> Html msg
view (Rectangle { backgroundColor, borderRadius, height, width }) =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height height
            , Css.width width
            , Css.borderRadius borderRadius
            ]
        ]
        []
