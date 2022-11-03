module Counter exposing (Model, Msg, init, update, view)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type Model
    = Model Int


type Msg
    = Increment
    | Decrement


init : Model
init =
    Model 0


update : Msg -> Model -> Model
update msg (Model count) =
    case msg of
        Increment ->
            Model (count + 1)

        Decrement ->
            Model (count - 1)


view : Model -> Html Msg
view (Model count) =
    div []
        [ button [ onClick Increment ] [ text "+1" ]
        , div [] [ text <| String.fromInt count ]
        , button [ onClick Decrement ] [ text "-1" ]
        ]
