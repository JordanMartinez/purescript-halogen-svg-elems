module Test.Main where

import Prelude

import Data.Foldable (for_)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Halogen (ClassName(..), Component)
import Halogen.Aff (selectElement)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Halogen.Svg.Attributes (Color(..))
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Elements as SE
import Halogen.VDom.Driver (runUI)
import Web.DOM.ParentNode (QuerySelector(..))

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
          [ SE.circle
              [ HP.id "circleId"
              , SA.cx 5.0
              , SA.cy 5.0
              , SA.r 4.0
              , SA.stroke $ Named "blue"
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
