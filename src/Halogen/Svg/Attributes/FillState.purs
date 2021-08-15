module Halogen.Svg.Attributes.FillState
  ( FillState(..)
  , printFillState
  ) where

import Prelude

data FillState
  = Freeze
  | Remove

derive instance eqFillState :: Eq FillState

instance showFillState :: Show FillState where
  show = case _ of
    Freeze -> "Freeze"
    Remove -> "Remove"

printFillState :: FillState -> String
printFillState = case _ of
  Freeze -> "freeze"
  Remove -> "remove"
