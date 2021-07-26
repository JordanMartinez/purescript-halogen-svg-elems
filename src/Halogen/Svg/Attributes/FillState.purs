module Halogen.Svg.Attributes.FillState
  ( FillState(..)
  , printFillState
  ) where

data FillState
  = Freeze
  | Remove

printFillState :: FillState -> String
printFillState = case _ of
  Freeze -> "freeze"
  Remove -> "remove"
