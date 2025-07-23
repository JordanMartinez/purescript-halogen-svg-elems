module Halogen.Svg.Attributes.ContentType.NumberOptionalNumber where

import Prelude

import Data.Tuple (Tuple(..))

class IsNumberOptionalNumber a where
  isNumberOptionalNumber :: a -> String

instance IsNumberOptionalNumber Number where
  isNumberOptionalNumber a = show a

instance IsNumberOptionalNumber (Tuple Number Number) where
  isNumberOptionalNumber (Tuple a b) = show a <> " " <> show b