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
    = ChangeCounter CounterId Counter.UpdateType


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeCounter id updateType ->
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
        [ Counter.view (ChangeCounter Counter1 Counter.IncrementCounter) (ChangeCounter Counter1 Counter.DecrementCounter) model.count1
        , Counter.view (ChangeCounter Counter2 Counter.IncrementCounter) (ChangeCounter Counter2 Counter.DecrementCounter) model.count2
        , Counter.view (ChangeCounter Counter3 Counter.IncrementCounter) (ChangeCounter Counter3 Counter.DecrementCounter) model.count3
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
