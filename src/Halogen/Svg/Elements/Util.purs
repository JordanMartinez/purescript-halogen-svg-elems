module Halogen.Svg.Elements.Util where

import Prelude

import Halogen (ElemName(..), Namespace(..))
import Halogen.HTML (HTML(..), elementNS, IProp(..))

-- | This `element` rather than `Halogen.HTML.Elements.element` must be used
-- | because all SVG elements created via JavaScript must have the svg namespace:
-- | `"http://www.w3.org/2000/svg"`
element :: forall r w i. ElemName -> Array (IProp r i) -> Array (HTML w i) -> HTML w i
element = elementNS (Namespace "http://www.w3.org/2000/svg")