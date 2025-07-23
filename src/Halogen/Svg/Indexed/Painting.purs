module Halogen.Svg.Indexed.Painting where

import Prelude

import Halogen.Svg.Indexed.Class (AriaAttributes, ConditionalProcessingAttributes, CoreAttributes, GlobalEventAttributes, DocumentElementEventAttributes, PresentationAttributes)
import Type.Row (type (+))

type SVGMarker = 
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( viewBox :: String
  , preserveAspectRatio :: String
  , refX :: String
  , refY :: String
  , markerUnits :: String
  , markerWidth :: String
  , markerHeight :: String
  , orient :: String
  )