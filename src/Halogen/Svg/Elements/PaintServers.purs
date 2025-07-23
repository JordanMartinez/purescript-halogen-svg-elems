module Halogen.Svg.Elements.PaintServers where

import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed (SVGlinearGradient, SVGradialGradient, SVGpattern, SVGstop)

linearGradient :: forall p i. Node SVGlinearGradient p i
linearGradient = element (ElemName "linearGradient")

radialGradient :: forall p i. Node SVGradialGradient p i
radialGradient = element (ElemName "radialGradient")

pattern :: forall p i. Node SVGpattern p i
pattern = element (ElemName "pattern")

stop :: forall p i. Node SVGstop p i
stop = element (ElemName "stop")