module Halogen.Svg.Elements.Painting where

import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Painting (SVGMarker)

marker :: forall p i. Node SVGMarker p i
marker = element (ElemName "marker")