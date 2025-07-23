module Halogen.Svg.Indexed.Shapes where

import Prelude

import Halogen.Svg.Indexed.Class (AriaAttributes, ConditionalProcessingAttributes, CoreAttributes, DocumentElementEventAttributes, GlobalEventAttributes, PresentationAttributes)
import Type.Row (type (+))

type SVGrect = 
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( pathLength :: String
  , x :: String
  , y :: String
  , rx :: String
  , ry :: String
  , width :: String
  , height :: String
  , transform :: String
  )

type SVGcircle = 
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( pathLength :: String
  , cx :: String
  , cy :: String
  , r :: String
  )

type SVGellipse = 
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( pathLength :: String
  , cx :: String
  , cy :: String
  , rx :: String
  , ry :: String
  )

type SVGline = 
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( pathLength :: String
  , x1 :: String
  , y1 :: String
  , x2 :: String
  , y2 :: String
  )

type SVGpolyline =
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( pathLength :: String
  , points :: String
  )

type SVGpolygon = 
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( pathLength :: String
  , points :: String
  )
