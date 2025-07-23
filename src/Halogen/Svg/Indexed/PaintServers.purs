module Halogen.Svg.Indexed.PaintServers where

import Prelude

import Halogen.Svg.Indexed.Class (AriaAttributes, ConditionalProcessingAttributes, CoreAttributes, GlobalEventAttributes, DocumentElementEventAttributes, PresentationAttributes)
import Type.Row (type (+))


type SVGlinearGradient =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( x1 :: String
  , y1 :: String
  , x2 :: String
  , y2 :: String
  , gradientUnits :: String
  , gradientTransform :: String
  , spreadMethod :: String
  , href :: String
  )

type SVGradialGradient =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( cx :: String
  , cy :: String
  , r :: String
  , fx :: String
  , fy :: String
  , fr :: String
  , gradientUnits :: String
  , gradientTransform :: String
  , spreadMethod :: String
  , href :: String
  )


type SVGstop =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( offset :: String
  )

type SVGpattern =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( viewBox :: String
  , preserveAspectRatio :: String
  , x :: String
  , y :: String
  , width :: String
  , height :: String
  , patternUnits :: String
  , patternContentUnits :: String
  , patternTransform :: String
  , href :: String
  )