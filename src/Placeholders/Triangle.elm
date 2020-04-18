module Placeholders.Triangle exposing
    ( Triangle, Corner(..), default, withBottomCorner, withLeftCorner, withRightCorner
    , view
    )

{-| Renders a triangle placeholder.


# Definition

@docs Triangle, Corner, default, withBottomCorner, withLeftCorner, withRightCorner


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a triangle placeholder
-}
type alias Triangle =
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
    { backgroundColor = Css.rgba 0 0 0 0.3
    , corner = Top
    , size = Css.px 100
    }


{-| Sets the right corner to a given triangle.
-}
withRightCorner : Triangle -> Triangle
withRightCorner triangle =
    { triangle | corner = Right }


{-| Sets the bottom corner to a given triangle.
-}
withBottomCorner : Triangle -> Triangle
withBottomCorner triangle =
    { triangle | corner = Bottom }


{-| Sets the left corner to a given triangle.
-}
withLeftCorner : Triangle -> Triangle
withLeftCorner triangle =
    { triangle | corner = Left }


{-| Renders a triangle placeholder using the given configuration.
-}
view : Triangle -> Html msg
view { backgroundColor, corner, size } =
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
        [ Html.css
            [ Css.height Css.zero
            , Css.width Css.zero
            , Css.borderStyle Css.solid
            , borderWidth
            , borderColor
            ]
        ]
        []
