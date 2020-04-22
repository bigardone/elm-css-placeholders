module Placeholders.Triangle exposing
    ( Triangle, Corner(..), default, withBottomCorner, withLeftCorner, withRightCorner, withBackgroundColor, withSize
    , view
    )

{-| Renders a triangle placeholder.


# Definition

@docs Triangle, Corner, default, withBottomCorner, withLeftCorner, withRightCorner, withBackgroundColor, withSize


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a triangle placeholder
-}
type Triangle
    = Triangle
        { backgroundColor : Css.Color
        , corner : Corner
        , size : Css.Px
        }


{-| Represents a triangle corner.
-}
type Corner
    = Top
    | Right
    | Bottom
    | Left


{-| Returns a default configuration for a triangle placeholder.
-}
default : Triangle
default =
    Triangle
        { backgroundColor = Css.rgba 0 0 0 0.3
        , corner = Top
        , size = Css.px 100
        }


{-| Adds `backgroundColor` to a `Triangle`.
-}
withBackgroundColor : Css.Color -> Triangle -> Triangle
withBackgroundColor color (Triangle triangle) =
    Triangle { triangle | backgroundColor = color }


{-| Adds `size` to a `Triangle`.
-}
withSize : Css.Px -> Triangle -> Triangle
withSize size (Triangle triangle) =
    Triangle { triangle | size = size }


{-| Sets the right corner to a given triangle.
-}
withRightCorner : Triangle -> Triangle
withRightCorner (Triangle triangle) =
    Triangle { triangle | corner = Right }


{-| Sets the bottom corner to a given triangle.
-}
withBottomCorner : Triangle -> Triangle
withBottomCorner (Triangle triangle) =
    Triangle { triangle | corner = Bottom }


{-| Sets the left corner to a given triangle.
-}
withLeftCorner : Triangle -> Triangle
withLeftCorner (Triangle triangle) =
    Triangle { triangle | corner = Left }


{-| Renders a triangle placeholder using the given configuration.
-}
view : Triangle -> Html msg
view (Triangle { backgroundColor, corner, size }) =
    let
        ( borderWidth, borderColor ) =
            case corner of
                Top ->
                    ( Css.borderWidth4 Css.zero size size size
                    , Css.borderColor4 Css.transparent Css.transparent backgroundColor Css.transparent
                    )

                Right ->
                    ( Css.borderWidth4 size Css.zero size size
                    , Css.borderColor4 Css.transparent Css.transparent Css.transparent backgroundColor
                    )

                Bottom ->
                    ( Css.borderWidth4 size size Css.zero size
                    , Css.borderColor4 backgroundColor Css.transparent Css.transparent Css.transparent
                    )

                Left ->
                    ( Css.borderWidth4 size size size Css.zero
                    , Css.borderColor4 Css.transparent backgroundColor Css.transparent Css.transparent
                    )
    in
    Html.div
        [ Html.class "placeholder-triangle"
        , Html.css
            [ Css.height Css.zero
            , Css.width Css.zero
            , Css.borderStyle Css.solid
            , borderWidth
            , borderColor
            ]
        ]
        []
