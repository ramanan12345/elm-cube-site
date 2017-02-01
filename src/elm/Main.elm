module Main exposing (..)


import Window exposing (Size)
import Navigation exposing (program)
import Model exposing (Model)
import Update exposing (Msg(..), init, update)
import View exposing (view)
import Keyboard exposing (..)



-- MAIN

main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.batch [ Window.resizes SizeChange, Keyboard.presses onKeyPress ])
        }




