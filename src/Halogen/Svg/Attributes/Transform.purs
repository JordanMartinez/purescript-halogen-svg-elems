module Halogen.Svg.Attributes.Transform
  ( Transform(..)
  , printTransform
  ) where

import Prelude
import Halogen.Svg.Attributes.Utils (printArray, showWithSpaces)

data Transform
  = Matrix Number Number Number Number Number Number
  | Translate Number Number
  | Scale Number Number
  | Rotate Number Number Number
  | SkewX Number
  | SkewY Number

derive instance eqTransform :: Eq Transform

instance showTransform :: Show Transform where
  show = case _ of
    Matrix a b c d e f -> "(Matrix " <> showWithSpaces [a, b, c, d, e, f] <> ")"
    Translate x y      -> "(Translate " <> showWithSpaces [x, y] <> ")"
    Scale x y          -> "(Scale " <> showWithSpaces [x, y] <> ")"
    Rotate a x y       -> "(Rotate " <> showWithSpaces [a, x, y] <> ")"
    SkewX a            -> "(SkewX " <> show a <> ")"
    SkewY a            -> "(SkewY " <> show a <> ")"

printTransform :: Transform -> String
printTransform = case _ of
  Matrix a b c d e f -> "matrix("    <> printArray [a, b, c, d, e, f] <> ")"
  Translate x y      -> "translate(" <> printArray [x, y]             <> ")"
  Scale x y          -> "scale("     <> printArray [x, y]             <> ")"
  Rotate a x y       -> "rotate("    <> printArray [a, x, y]          <> ")"
  SkewX a            -> "skewX("     <> show a                        <> ")"
  SkewY a            -> "skewY("     <> show a                        <> ")"
