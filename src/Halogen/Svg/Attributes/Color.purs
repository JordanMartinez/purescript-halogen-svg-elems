module Halogen.Svg.Attributes.Color
  ( Color(RGB, RGBA, Named)
  , printColor
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Halogen.Svg.Attributes.Utils (printArray)

data Color = RGB Int Int Int
           | RGBA Int Int Int Number
           | Named String

printColor :: Maybe Color -> String
printColor = case _ of
  Just (RGB r g b)    -> "rgb("  <> printArray [r, g, b] <> ")"
  Just (RGBA r g b o) -> "rgba(" <> printArray [r, g, b] <> "," <> show o <> ")"
  Just (Named str)    -> str
  Nothing             -> "None"
