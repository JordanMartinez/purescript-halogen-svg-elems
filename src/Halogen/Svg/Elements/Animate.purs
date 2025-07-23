module Halogen.Svg.Elements.Animate where

import Prelude

import Halogen.HTML (ElemName(..), Node, Leaf)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Animate (SVGanimate, SVGanimateMotion, SVGset, SVGanimateColor, SVGanimateTransform, SVGmpath)

animate :: forall p i. Node SVGanimate p i
animate = element (ElemName "animate")

set :: forall p i. Node SVGset p i
set = element (ElemName "set")

animateMotion :: forall p i. Node SVGanimateMotion p i
animateMotion = element (ElemName "animateMotion")

animateColor :: forall p i. Node SVGanimateColor p i
animateColor = element (ElemName "animateColor")

animateTransform :: forall p i. Node SVGanimateTransform p i
animateTransform = element (ElemName "animateTransform")

mpath :: forall p i. Node SVGmpath p i
mpath = element (ElemName "mpath")