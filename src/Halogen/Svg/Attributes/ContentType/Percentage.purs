module Halogen.Svg.Attributes.ContentType.Percentage where

import Prelude

import Halogen.HTML (class IsProp)
import Halogen.VDom.DOM.Prop (propFromNumber, propFromString)

data Percentage = Percentage Number

printPercentage :: Percentage -> String
printPercentage (Percentage n) = show n <> "%"

instance IsProp Percentage where
  toPropValue (Percentage n) = propFromString (show n <> "%")