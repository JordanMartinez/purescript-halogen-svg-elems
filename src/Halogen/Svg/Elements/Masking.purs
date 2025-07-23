module Halogen.Svg.Elements.Masking where

import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Masking (SVGclipPath, SVGmask)

clipPath :: forall p i. Node SVGclipPath p i
clipPath = element (ElemName "clipPath")

mask :: forall p i. Node SVGmask p i
mask = element (ElemName "mask")