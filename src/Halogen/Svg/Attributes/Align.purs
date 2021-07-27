module Halogen.Svg.Attributes.Align
  ( Align(..)
  , printAlign
  ) where

import Prelude

data Align
  = Min
  | Mid
  | Max

derive instance eqAlign :: Eq Align

printAlign :: Align -> String
printAlign = case _ of
  Min -> "Min"
  Mid -> "Mid"
  Max -> "Max"
