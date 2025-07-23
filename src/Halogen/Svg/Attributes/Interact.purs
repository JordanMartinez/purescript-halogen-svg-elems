module Halogen.Svg.Attributes.Interact where

import Prelude

import Halogen.HTML (AttrName(..), IProp, attr)

data PointerEvents
  = PointerEventsAuto
  | PointerEventsBoundingBox
  | PointerEventsVisiblePainted
  | PointerEventsVisibleFill
  | PointerEventsVisibleStroke
  | PointerEventsVisible
  | PointerEventsPainted
  | PointerEventsFill
  | PointerEventsStroke
  | PointerEventsAll
  | PointerEventsNone

instance Show PointerEvents where
  show = case _ of
    PointerEventsAuto -> "auto"
    PointerEventsBoundingBox -> "bounding-box"
    PointerEventsVisiblePainted -> "visiblePainted"
    PointerEventsVisibleFill -> "visibleFill"
    PointerEventsVisibleStroke -> "visibleStroke"
    PointerEventsVisible -> "visible"
    PointerEventsPainted -> "painted"
    PointerEventsFill -> "fill"
    PointerEventsStroke -> "stroke"
    PointerEventsAll -> "all"
    PointerEventsNone -> "none"

pointerEvents :: forall r i. PointerEvents -> IProp (pointerEvents :: String | r) i
pointerEvents = attr (AttrName "pointer-events") <<< show