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

instance showAlign :: Show Align where
  show = case _ of
    Min -> "Min"
    Mid -> "Mid"
    Max -> "Max"

printAlign :: Align -> String
printAlign = case _ of
  Min -> "Min"
  Mid -> "Mid"
  Max -> "Max"
