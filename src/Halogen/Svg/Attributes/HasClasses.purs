module Halogen.Svg.Attributes.HasClasses where

import Prelude

import Halogen.HTML (IProp)

class HasNone a where
  none :: a

class HasAuto a where
  auto :: a

class HasInherit a where
  inherit :: a

class HasDefault a where
  default :: a



