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

printMarkerUnit :: MarkerUnit -> String
printMarkerUnit = case _ of
  UserSpaceOnUse -> "userSpaceOnUse"
  StrokeWidth    -> "strokeWidth"
