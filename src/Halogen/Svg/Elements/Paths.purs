module Halogen.Svg.Elements.Paths where

import Prelude

import Halogen.HTML (ElemName(..), Leaf, Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Paths (SVGpath)

path :: forall p i. Node SVGpath p i
path = element (ElemName "path")
