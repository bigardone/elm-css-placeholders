module Placeholders.Block exposing
    ( Block, default, withItems, init
    , Msg, update
    , view
    )

{-| Renders a text block placeholder.


# Definition

@docs Block, default, withItems, init


# Update

@docs Msg, update


# View

@docs view

-}

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html
import Html.Styled.Keyed as HtmlKeyed
import Random
import Random.List


{-| Represents the configuration for a text block placeholder.
It has the following attributes:

  - `backgroundColor`: takes a `Css.Color` and represents the background color of the lines.
  - `height`: takes a `Css.Px` and represents the height of the lines.
  - `items`: a list of integers which is used to randomize the number of lines.

-}
type alias Block =
    { backgroundColor : Css.Color
    , height : Css.Px
    , items : List Int
    }


{-| Returns a default configuration for a block placeholder.
-}
default : Block
default =
    { backgroundColor = Css.rgba 0 0 0 0.3
    , height = Css.px 4
    , items = [ 1, 2, 3, 4, 5 ]
    }


{-| Adds `items` to a `Block`.
-}
withItems : List Int -> Block -> Block
withItems items block =
    { block | items = items }


{-| Inits a block placeholder shuffling its items.
-}
init : Block -> ( Block, Cmd Msg )
init block =
    ( block, block.items |> Random.List.shuffle |> Random.generate ShuffleItems )


{-| Block msg.
-}
type Msg
    = ShuffleItems (List Int)


{-| Block update.
-}
update : Msg -> Block -> ( Block, Cmd Msg )
update msg block =
    case msg of
        ShuffleItems items ->
            ( { block | items = items }, Cmd.none )


{-| Renders a block placeholder using the given configuration.
-}
view : Block -> Html msg
view ({ items } as blockConfig) =
    items
        |> List.map (item blockConfig)
        |> HtmlKeyed.node "div"
            [ Html.css
                [ Css.displayFlex
                , Css.flexWrap Css.wrap
                , Css.justifyContent Css.start
                , Css.width <| Css.pct 100
                ]
            ]


item : Block -> Int -> ( String, Html msg )
item { backgroundColor, height } numberOfItems =
    ( String.fromInt numberOfItems
    , Html.div
        [ Html.css
            [ Css.marginBottom <| Css.px 8
            , Css.marginRight <| Css.px 8
            , Css.property "width" (String.fromInt (numberOfItems * 10) ++ "%")
            ]
        ]
        [ Html.div
            [ Html.css
                [ Css.backgroundColor backgroundColor
                , Css.height height
                , Css.marginRight <| Css.px 8
                , Css.borderRadius <| Css.px 9999
                , Css.width <| Css.pct 100
                ]
            ]
            []
        ]
    )
