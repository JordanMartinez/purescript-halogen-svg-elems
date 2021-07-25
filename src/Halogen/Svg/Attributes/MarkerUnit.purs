module Halogen.Svg.Attributes.MarkerUnit
  ( MarkerUnit(UserSpaceOnUse, StrokeWidth)
  , printMarkerUnit
  ) where

import Prelude

data MarkerUnit
  = UserSpaceOnUse
  | StrokeWidth

instance showMarkerUnit :: Show MarkerUnit where
  show = case _ of
    UserSpaceOnUse -> "userSpaceOnUse"
    StrokeWidth    -> "strokeWidth"

printMarkerUnit :: MarkerUnit -> String
printMarkerUnit = case _ of
  UserSpaceOnUse -> "userSpaceOnUse"
  StrokeWidth    -> "strokeWidth"
