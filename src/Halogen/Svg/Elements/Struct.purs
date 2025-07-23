module Halogen.Svg.Elements.Struct where

import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Struct

svg :: forall p i. Node SVGsvg p i
svg = element (ElemName "svg")

g :: forall p i. Node SVGg p i
g = element (ElemName "g")

defs :: forall p i. Node SVGdefs p i
defs = element (ElemName "defs")

symbol :: forall p i. Node SVGsymbol p i
symbol = element (ElemName "symbol")

use :: forall p i. Node SVGuse p i
use = element (ElemName "use")

switch :: forall p i. Node SVGswitch p i
switch = element (ElemName "switch")

title :: forall p i. Node SVGtitle p i
title = element (ElemName "title")

desc :: forall p i. Node SVGdesc p i
desc = element (ElemName "desc")

metadata :: forall p i. Node SVGmetadata p i
metadata = element (ElemName "metadata")







