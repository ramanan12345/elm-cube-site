module Room.View exposing (..)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes as Attributes exposing (class, style, id, href, classList, map)
import Room.Model exposing (Room, Wall)
import Room.Styles.Css as Css exposing (..)
import Room.Wall.Top as Top exposing (content)


view : Room -> Html msg
view room =
    div [ class "roomContainer" ]
        [ div
            [ classList
                [ ( "room", True )
                , ( "roomTop", room.active == Room.Model.Top )
                , ( "roomRight", room.active == Room.Model.Right )
                , ( "roomBottom", room.active == Room.Model.Bottom )
                , ( "roomLeft", room.active == Room.Model.Left )
                , ( "roomCenter", room.active == Room.Model.Center )
                ]
            , Css.additionalStyles room
            ]
            (List.map
                (\wall -> buildWalls wall room.active room.size.height)
                room.walls
            )
        ]



{- fills the room with walls styled according to the current view
   and window height
-}


buildWalls : Wall -> Wall -> Int -> Html msg
buildWalls wall active height_ =
    div
        [ classList
            [ ( "wall", True )
            , ( "top", wall == Room.Model.Top )
            , ( "right", wall == Room.Model.Right )
            , ( "floor", wall == Room.Model.Bottom )
            , ( "left", wall == Room.Model.Left )
            , ( "center", wall == Room.Model.Center )
            ]
        , Css.additionalWallStyles wall active height_
        ]
        [
            case wall of
                Room.Model.Top ->
                    content active
                _ ->
                    div [][]
        ]
