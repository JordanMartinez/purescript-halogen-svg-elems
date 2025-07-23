module Halogen.Svg.Attributes.ContentType.Transform where

import Prelude

import Data.String (joinWith)

data Transform
  = Matrix Number Number Number Number Number Number
  | Translate Number Number
  | Scale Number Number
  | Rotate Number Number Number
  | SkewX Number
  | SkewY Number

derive instance Eq Transform

instance Show Transform where
  show = case _ of
    Matrix a b c d e f -> "matrix(" <> show a <> "," <> show b <> "," <> show c <> "," <> show d <> "," <> show e <> "," <> show f <> ")"
    Translate x y -> "translate(" <> show x <> "," <> show y <> ")"
    Scale x y -> "scale(" <> show x <> "," <> show y <> ")"
    Rotate a x y -> "rotate(" <> show a <> "," <> show x <> "," <> show y <> ")"
    SkewX a -> "skewX(" <> show a <> ")"
    SkewY a -> "skewY(" <> show a <> ")"

class IsTransform a where
  isTransform :: a -> String

instance IsTransform Transform where
  isTransform = show

instance IsTransform (Array Transform) where
  isTransform = joinWith " " <<< map isTransform
