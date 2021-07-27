module Halogen.Svg.Attributes.FillState
  ( FillState(..)
  , printFillState
  ) where

data FillState
  = Freeze
  | Remove

derive instance eqFillState :: Eq FillState

printFillState :: FillState -> String
printFillState = case _ of
  Freeze -> "freeze"
  Remove -> "remove"
