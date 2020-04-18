module Placeholders.Rectangle exposing
    ( Rectangle, default
    , view
    )

{-| Renders a rectangle placeholder.


# Definition

@docs Rectangle, default


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html


{-| Represents the configuration for a rectangle placeholder
-}
type alias Rectangle =
    { backgroundColor : Css.Color
    , borderRadius : Css.Px
    , height : Css.Px
    }


{-| Returns a default configuration for a rectangle placeholder.
-}
default : Rectangle
default =
    { backgroundColor = Css.rgba 0 0 0 0.3
    , borderRadius = Css.px 4
    , height = Css.px 100
    }


{-| Renders a rectangle placeholder using the given configuration.
-}
view : Rectangle -> Html msg
view { backgroundColor, borderRadius, height } =
    Html.div
        [ Html.css
            [ Css.backgroundColor backgroundColor
            , Css.height height
            , Css.width <| Css.pct 100
            , Css.borderRadius borderRadius
            ]
        ]
        []
