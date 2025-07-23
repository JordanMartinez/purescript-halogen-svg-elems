module Halogen.Svg.Indexed.Text where

import Prelude

import Halogen.Svg.Indexed.Class (AriaAttributes, ConditionalProcessingAttributes, CoreAttributes, GlobalEventAttributes, DocumentElementEventAttributes, PresentationAttributes)
import Type.Row (type (+))

type SVGtext = 
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( x :: String
  , y :: String
  , dx :: String
  , dy :: String
  , rotate :: String
  , textLength :: String
  )

-- aria attributes
type SVGtspan =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( x :: String
  , y :: String
  , dx :: String
  , dy :: String
  , rotate :: String
  , textLength :: String
  )