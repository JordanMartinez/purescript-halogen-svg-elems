module Halogen.Svg.Attributes.Shapes where

import Prelude

import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.HTML.Core (AttrName(..))

class IsPoints a where
  isPoints :: a -> String

instance IsPoints (Tuple Int Int) where
  isPoints (Tuple x y) = show x <> "," <> show y

instance IsPoints (Tuple Number Number) where
  isPoints (Tuple x y) = show x <> "," <> show y

instance IsPoints (Array (Tuple Int Int)) where
  isPoints = joinWith " " <<< map isPoints

instance IsPoints (Array (Tuple Number Number)) where
  isPoints = joinWith " " <<< map isPoints


points :: forall a r i. IsPoints a => a -> IProp (points :: String | r) i
points = attr (AttrName "points") <<< isPoints





