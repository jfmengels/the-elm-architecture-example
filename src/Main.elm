module Main exposing (main)

import Browser
import Counter
import Html exposing (Html, button, div, text)
import Html.Attributes as Attr
import Html.Events exposing (onClick)


type alias Model =
    { count1 : Counter.Model
    , count2 : Counter.Model
    , count3 : Counter.Model
    }


initialModel : Model
initialModel =
    { count1 = Counter.init
    , count2 = Counter.init
    , count3 = Counter.init
    }


type CounterId
    = Counter1
    | Counter2
    | Counter3


type Msg
    = ChangeCounter CounterId Counter.Msg


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
        [ Counter.view model.count1
            |> Html.map (ChangeCounter Counter1)
        , Counter.view model.count2
            |> Html.map (ChangeCounter Counter2)
        , Counter.view model.count3
            |> Html.map (ChangeCounter Counter3)
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
