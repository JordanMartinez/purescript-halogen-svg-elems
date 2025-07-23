module SvgSpecificationTests.Main where

import Prelude

import Data.Array as A
import Data.Map (Map)
import Data.Map as M
import Data.Maybe (fromMaybe, maybe)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Halogen (Component, ComponentHTML, HalogenM, HalogenQ, defaultEval, mkComponent, mkEval, modify_)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.HTML as HH
import Halogen.HTML.Events as HP
import Halogen.VDom.Driver (runUI)
import SvgSpecificationTests.Animate as Animate
import SvgSpecificationTests.Painting as Painting
import SvgSpecificationTests.Paths as Paths
import SvgSpecificationTests.References (ReferenceTest, referenceTable)
import SvgSpecificationTests.Shapes as Shapes
import SvgSpecificationTests.Text as Text

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody
  runUI component unit body

type Input = Unit

type State = { selectedSection :: String }

data Action
  = SelectSection String

data Query a

type Output = Void

referenceSections :: forall p i. Map String (Array (ReferenceTest p i))
referenceSections = M.fromFoldable
  [ Tuple "Text" Text.referenceTests
  , Tuple "Painting" Painting.referenceTests
  , Tuple "Shapes" Shapes.referenceTests
  , Tuple "Paths" Paths.referenceTests
  , Tuple "Animate" Animate.referenceTests
  ]


component :: forall m. Component Query Input Output m
component = mkComponent { initialState, render, eval }
  where
    initialState _ = { selectedSection: "Painting" }

    render :: State -> ComponentHTML Action () m
    render { selectedSection } = HH.div_
      [ HH.h1_ [ HH.text "SVG Specification Tests" ]
      , HH.select
          [ HP.onValueChange SelectSection ]
          ( A.fromFoldable (M.keys referenceSections) <#> \key ->
            HH.option_ [ HH.text key ]
          )
      , maybe (HH.text selectedSection) (referenceTable selectedSection) (M.lookup selectedSection referenceSections)
      ]

    eval :: HalogenQ Query Action Input ~> HalogenM State Action () Void m
    eval = mkEval (defaultEval { handleAction = handleAction })
      where
        handleAction = case _ of
          SelectSection section -> do
            modify_ (_ { selectedSection = section })


{-
main :: Effect Unit
main = launchAff_ do
  mbDivElem <- selectElement $ QuerySelector "#halogen"
  for_ mbDivElem \divElem -> do
    void $ runUI rootComp 0 divElem

type Input = Int
type Output = Int
data Query a = Query a

data SvgContainerSize
  = Small
  | Medium
  | Large

renderSize :: SvgContainerSize -> String
renderSize = case _ of
  Small -> "small"
  Medium -> "medium"
  Large -> "large"

rootComp :: Component Query Input Output Aff
rootComp = Hooks.component \_ _ -> Hooks.do
  let
    testSvg size elems =
      SE.svg
        [ SA.classes
            [ ClassName "svg-test"
            , ClassName $ "svg-test--" <> renderSize size
            ]
        , SA.viewBox 0.0 0.0 100.0 100.0
        ]
        elems

    testSvg' size elem = testSvg size [ elem ]

  Hooks.pure do
    HH.div
      [ HP.id "svg-test-container" ]
      [ testSvg' Small $ SE.circle
          [ HP.id "circleId"
          , SA.cx 5.0
          , SA.cy 5.0
          , SA.r 4.0
          , SA.stroke $ Named "blue"
          ]
      , testSvg Small
          -- https://developer.mozilla.org/en-US/docs/Web/SVG/Element/use
          [ SE.defs []
              [ SE.circle
                  [ HP.id "circleId"
                  , SA.cx 5.0
                  , SA.cy 5.0
                  , SA.r 4.0
                  , SA.stroke $ Named "blue"
                  ]
              , SE.polyline
                  [ HP.id "polylineId"
                  , SA.points
                      [ Tuple 1.0 1.0
                      , Tuple 1.0 9.0
                      , Tuple 9.0 9.0
                      , Tuple 9.0 1.0
                      ]
                  ]
              , SE.linearGradient
                  [ SA.id "sunset"
                  , SA.gradientTransform [ Rotate 90.0 0.0 0.0 ]
                  ]
                  [ SE.stop [ SA.offset "5%", SA.stopColor (Named "gold") ]
                  , SE.stop [ SA.offset "95%", SA.stopColor (Named "red") ]
                  ]
              , SE.radialGradient
                  [ SA.id "fireball" ]
                  [ SE.stop [ SA.offset "10%", SA.stopColor (Named "gold") ]
                  , SE.stop [ SA.offset "95%", SA.stopColor (Named "red"), SA.stopOpacity 0.3 ]
                  ]
              ]
          , SE.use
              [ SA.href "#circleId"
              , SA.x 10.0
              , SA.fill $ Named "blue"
              ]
          , SE.use
              [ SA.href "#circleId"
              , SA.x 20.0
              , SA.fill $ Named "white"
              , SA.stroke $ Named "red"
              ]
          , SE.use
              [ SA.href "#circleId"
              , SA.x 30.0
              , SA.fillGradient "#sunset"
              , SA.stroke $ Named "red"
              ]
          , SE.use
              [ SA.href "#circleId"
              , SA.x 40.0
              , SA.fillGradient "#fireball"
              , SA.stroke $ Named "red"
              ]
          , SE.use
              [ SA.href "#polylineId"
              , SA.x 50.0
              , SA.fillGradient "#sunset"
              , SA.stroke $ Named "red"
              ]
          ]
      , testSvg Large
          [ SE.polygon
              [ SA.points
                  [ Tuple 0.0 0.0
                  , Tuple 0.0 1.0
                  , Tuple 1.0 1.0
                  , Tuple 1.0 0.0
                  ]
              ]
          ]
      ]
      -}