module Counter exposing (UpdateType(..), update, view)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type UpdateType
    = IncrementCounter
    | DecrementCounter


update : UpdateType -> Int -> Int
update updateType count =
    case updateType of
        IncrementCounter ->
            count + 1

        DecrementCounter ->
            count - 1


view : msg -> msg -> Int -> Html msg
view onIncrement onDecrement count =
    div []
        [ button [ onClick onIncrement ] [ text "+1" ]
        , div [] [ text <| String.fromInt count ]
        , button [ onClick onDecrement ] [ text "-1" ]
        ]
