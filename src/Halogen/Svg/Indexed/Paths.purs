module Halogen.Svg.Indexed.Paths where

import Prelude

import Halogen.Svg.Indexed.Class (AriaAttributes, ConditionalProcessingAttributes, CoreAttributes, GlobalEventAttributes, DocumentElementEventAttributes, PresentationAttributes)
import Type.Row (type (+))

type SVGpath =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( d :: String
  , pathLength :: String
  )