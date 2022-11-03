module Counter exposing (view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes as Attr
import Html.Events exposing (onClick)


view : msg -> msg -> Int -> Html msg
view onIncrement onDecrement count =
    div []
        [ button [ onClick onIncrement ] [ text "+1" ]
        , div [] [ text <| String.fromInt count ]
        , button [ onClick onDecrement ] [ text "-1" ]
        ]
