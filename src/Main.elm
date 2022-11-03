module Main exposing (main)

import Browser
import Counter
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
    = ChangeCounter Counter.UpdateType CounterId


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeCounter updateType id ->
            case id of
                Counter1 ->
                    { model | count1 = Counter.update updateType model.count1 }

                Counter2 ->
                    { model | count2 = Counter.update updateType model.count2 }

                Counter3 ->
                    { model | count3 = Counter.update updateType model.count3 }


view : Model -> Html Msg
view model =
    div [ Attr.style "display" "flex" ]
        [ Counter.view (ChangeCounter Counter.IncrementCounter Counter1) (ChangeCounter Counter.DecrementCounter Counter1) model.count1
        , Counter.view (ChangeCounter Counter.IncrementCounter Counter2) (ChangeCounter Counter.DecrementCounter Counter2) model.count2
        , Counter.view (ChangeCounter Counter.IncrementCounter Counter3) (ChangeCounter Counter.DecrementCounter Counter3) model.count3
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
