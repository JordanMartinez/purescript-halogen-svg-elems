module Halogen.Svg.Elements.Text
  ( text
  , tspan
  )
  where

import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Text (SVGtext, SVGtspan)

text :: forall p i. Node SVGtext p i
text = element (ElemName "text")

tspan :: forall p i. Node SVGtspan p i
tspan = element (ElemName "tspan")