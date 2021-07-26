module Halogen.Svg.Attributes.Align
  ( Align(..)
  , printAlign
  ) where

data Align
  = Min
  | Mid
  | Max

printAlign :: Align -> String
printAlign = case _ of
  Min -> "Min"
  Mid -> "Mid"
  Max -> "Max"
