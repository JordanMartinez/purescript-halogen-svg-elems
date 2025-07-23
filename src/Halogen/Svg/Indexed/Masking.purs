module Halogen.Svg.Indexed.Masking where

import Prelude

import Halogen.Svg.Indexed (ConditionalProcessingAttributes, CoreAttributes, PresentationAttributes)
import Type.Row (type (+))

type SVGclipPath =
  ConditionalProcessingAttributes +
  CoreAttributes +
  PresentationAttributes +
  ( class :: String
  , style :: String
  , externalResourcesRequired :: String
  , transform :: String
  , clipPathUnits :: String
  )

type SVGmask =
  ConditionalProcessingAttributes +
  CoreAttributes +
  PresentationAttributes +
  ( class :: String
  , style :: String
  , externalResourcesRequired :: String
  , x :: String
  , y :: String
  , width :: String
  , height :: String
  , maskUnits :: String
  , maskContentUnits :: String
  )
