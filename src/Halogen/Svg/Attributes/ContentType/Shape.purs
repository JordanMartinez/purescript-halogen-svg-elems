module Halogen.Svg.Attributes.ContentType.Shape where

import Prelude

-- https://www.w3.org/TR/2008/REC-CSS2-20080411/visufx.html#value-def-shape
data Shape a = Rect { top :: a, right :: a, bottom :: a, left :: a }

