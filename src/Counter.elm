module Counter exposing (Model, Msg(..), init, update, view)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = Increment
    | Decrement


init : Model
init =
    0


update : Msg -> Model -> Model
update msg count =
    case msg of
        Increment ->
            count + 1

        Decrement ->
            count - 1


view : Model -> Html Msg
view count =
    div []
        [ button [ onClick Increment ] [ text "+1" ]
        , div [] [ text <| String.fromInt count ]
        , button [ onClick Decrement ] [ text "-1" ]
        ]
