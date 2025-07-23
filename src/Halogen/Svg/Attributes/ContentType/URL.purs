module Halogen.Svg.Attributes.ContentType.URL where

import Prelude

newtype URL = URL String

instance Show URL where
  show (URL url) = url