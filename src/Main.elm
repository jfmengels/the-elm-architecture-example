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
    = Increment Int
    | Decrement Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment id ->
            case id of
                1 ->
                    { model | count1 = model.count1 + 1 }

                2 ->
                    { model | count2 = model.count2 + 1 }

                3 ->
                    { model | count3 = model.count3 + 1 }

                _ ->
                    model

        Decrement id ->
            case id of
                1 ->
                    { model | count1 = model.count1 - 1 }

                2 ->
                    { model | count2 = model.count2 - 1 }

                3 ->
                    { model | count3 = model.count3 - 1 }

                _ ->
                    model


view : Model -> Html Msg
view model =
    div [ Attr.style "display" "flex" ]
        [ counter (Increment 1) (Decrement 1) model.count1
        , counter (Increment 2) (Decrement 2) model.count2
        , counter (Increment 3) (Decrement 3) model.count3
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
