module Halogen.Svg.Attributes.MarkerUnit
  ( MarkerUnit(..)
  , printMarkerUnit
  ) where

import Prelude

data MarkerUnit
  = UserSpaceOnUse
  | StrokeWidth

derive instance eqMarkerUnit :: Eq MarkerUnit

instance showMarkerUnit :: Show MarkerUnit where
  show = case _ of
    UserSpaceOnUse -> "userSpaceOnUse"
    StrokeWidth    -> "strokeWidth"
-- This instance of Show is currently identical to printMarkerUnit. That is
-- likely to change so don't rely on it

printMarkerUnit :: MarkerUnit -> String
printMarkerUnit = case _ of
  UserSpaceOnUse -> "userSpaceOnUse"
  StrokeWidth    -> "strokeWidth"
