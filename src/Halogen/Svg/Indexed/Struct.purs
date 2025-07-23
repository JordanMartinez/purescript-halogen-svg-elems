module Halogen.Svg.Indexed.Struct where

import Prelude

import Halogen.HTML.Properties (height)
import Halogen.Svg.Indexed.Class (AriaAttributes, CoreAttributes, GlobalEventAttributes, ConditionalProcessingAttributes, DocumentElementEventAttributes, PresentationAttributes)
import Type.Row (type (+))

type SVGsvg =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes + 
  GlobalEventAttributes + 
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( viewBox :: String
  , preserveAspectRatio :: String
  , transform :: String
  , x :: String
  , y :: String
  , width :: String
  , height :: String
  )

type SVGg =
  AriaAttributes + 
  ConditionalProcessingAttributes +
  CoreAttributes + 
  GlobalEventAttributes + 
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( transform :: String )

type SVGdefs =
  CoreAttributes + 
  GlobalEventAttributes + 
  DocumentElementEventAttributes +
  PresentationAttributes +
  ()

type SVGsymbol =
  AriaAttributes + 
  CoreAttributes + 
  GlobalEventAttributes + 
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( preserveAspectRatio :: String
  , viewBox :: String
  , refX :: String
  , refY :: String
  )

type SVGuse = 
  AriaAttributes + 
  CoreAttributes + 
  GlobalEventAttributes + 
  DocumentElementEventAttributes +
  --GraphicalEventAttributes +
  PresentationAttributes +
  --DeprecatedXlinkAttributes +
  PresentationAttributes +
  ( href :: String
  , x :: String
  , y :: String
  , width :: String
  , height :: String
  )

type SVGswitch = 
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ()

type SVGtitle = 
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  ()

type SVGdesc = 
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  ()

type SVGmetadata = 
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  ()