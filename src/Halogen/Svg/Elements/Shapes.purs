module Halogen.Svg.Elements.Shapes where

import Halogen.Svg.Indexed.Shapes
import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)

rect :: forall p i. Node SVGrect p i
rect = element (ElemName "rect")

circle :: forall p i. Node SVGcircle p i
circle = element (ElemName "circle")

ellipse :: forall p i. Node SVGellipse p i
ellipse = element (ElemName "ellipse")

line :: forall p i. Node SVGline p i
line = element (ElemName "line")

polyline :: forall p i. Node SVGpolyline p i
polyline = element (ElemName "polyline")

polygon :: forall p i. Node SVGpolygon p i
polygon = element (ElemName "polygon")