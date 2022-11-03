module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes as Attr
import Html.Events exposing (onClick)


type alias Model =
    { count1 : Int
    , count2 : Int
    , count3 : Int
    }


initialModel : Model
initialModel =
    { count1 = 0
    , count2 = 0
    , count3 = 0
    }


type Msg
    = Increment1
    | Decrement1
    | Increment2
    | Decrement2
    | Increment3
    | Decrement3


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment1 ->
            { model | count1 = model.count1 + 1 }

        Decrement1 ->
            { model | count1 = model.count1 - 1 }

        Increment2 ->
            { model | count2 = model.count2 + 1 }

        Decrement2 ->
            { model | count2 = model.count2 - 1 }

        Increment3 ->
            { model | count3 = model.count3 + 1 }

        Decrement3 ->
            { model | count3 = model.count3 - 1 }


view : Model -> Html Msg
view model =
    div [ Attr.style "display" "flex" ]
        [ counter Increment1 Decrement1 model.count1
        , counter Increment2 Decrement2 model.count2
        , counter Increment3 Decrement3 model.count3
        ]


counter : msg -> msg -> Int -> Html msg
counter onIncrement onDecrement count =
    div []
        [ button [ onClick onIncrement ] [ text "+1" ]
        , div [] [ text <| String.fromInt count ]
        , button [ onClick onDecrement ] [ text "-1" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
