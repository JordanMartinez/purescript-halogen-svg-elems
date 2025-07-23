module Halogen.Svg.Attributes.PaintServers where

import Prelude

import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.ContentType.Transform (class IsTransform, isTransform)
import Halogen.Svg.Attributes.Filter (FilterUnits)
import Web.HTML.Common (AttrName(..))

patternUnits :: forall r i. FilterUnits -> IProp ("patternUnits" :: String | r) i
patternUnits = attr (AttrName "patternUnits") <<< show

patternContentUnits :: forall r i. FilterUnits -> IProp ("patternContentUnits" :: String | r) i
patternContentUnits = attr (AttrName "patternContentUnits") <<< show

patternTransform :: forall a r i. IsTransform a => a -> IProp ("patternTransform" :: String | r) i
patternTransform = attr (AttrName "patternTransform") <<< isTransform