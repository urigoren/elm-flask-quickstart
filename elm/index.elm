port module IndexPage exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Platform.Cmd exposing (..)
import Html.Events exposing (..)
port externalMessage : ((String, String) -> msg) -> Sub msg


main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
  { id: String
  , name: String
  }

type alias DefaultValues =
  { id: String
    , name: String
  }

init : DefaultValues -> (Model, Cmd Msg)
init defaults =
  { id = defaults.id
  , name = defaults.name
  } ! []

type Msg =  Test | ExternalMessage (String, String)

update msg model = case msg of
  (Test) -> ({model | name = "test"},  Cmd.none)
  (ExternalMessage (msg_type, msg_content)) -> (model, Cmd.none)

view : Model -> Html Msg
view model = let
        hello = "Hello "++model.name
    in
    div [] [text hello]

subscriptions : Model -> Sub Msg
subscriptions model = Sub.batch [ externalMessage ExternalMessage ]
