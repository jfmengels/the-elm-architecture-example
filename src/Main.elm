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


type CounterId
    = Counter1
    | Counter2
    | Counter3


type Msg
    = ChangeCounter UpdateType CounterId


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeCounter updateType id ->
            case id of
                Counter1 ->
                    { model | count1 = updateCounter updateType model.count1 }

                Counter2 ->
                    { model | count2 = updateCounter updateType model.count2 }

                Counter3 ->
                    { model | count3 = updateCounter updateType model.count3 }


type UpdateType
    = IncrementCounter
    | DecrementCounter


updateCounter : UpdateType -> Int -> Int
updateCounter updateType count =
    case updateType of
        IncrementCounter ->
            count + 1

        DecrementCounter ->
            count - 1


view : Model -> Html Msg
view model =
    div [ Attr.style "display" "flex" ]
        [ counter (ChangeCounter IncrementCounter Counter1) (ChangeCounter DecrementCounter Counter1) model.count1
        , counter (ChangeCounter IncrementCounter Counter2) (ChangeCounter DecrementCounter Counter2) model.count2
        , counter (ChangeCounter IncrementCounter Counter3) (ChangeCounter DecrementCounter Counter3) model.count3
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
