module Halogen.Svg.Attributes.Transform
  ( Transform(Matrix, Translate, Scale, Rotate, SkewX, SkewY)
  , printTransform
  ) where

import Prelude
import Halogen.Svg.Attributes.Utils (printArray)

data Transform
  = Matrix Number Number Number Number Number Number
  | Translate Number Number
  | Scale Number Number
  | Rotate Number Number Number
  | SkewX Number
  | SkewY Number

printTransform :: Transform -> String
printTransform = case _ of
  Matrix a b c d e f -> "matrix("    <> printArray [a, b, c, d, e, f] <> ")"
  Translate x y      -> "translate(" <> printArray [x, y]             <> ")"
  Scale x y          -> "scale("     <> printArray [x, y]             <> ")"
  Rotate a x y       -> "rotate("    <> printArray [a, x, y]          <> ")"
  SkewX a            -> "skewX("     <> show a                        <> ")"
  SkewY a            -> "skewY("     <> show a                        <> ")"
