module Halogen.Svg.Attributes.FontSize
  ( FontSize(..)
  , printFontSize
  ) where

import Prelude
import Halogen.Svg.Attributes.CSSLength (CSSLength, printCSSLength)

data FontSize
  = XXSmall
  | XSmall
  | Small
  | Medium
  | Large
  | XLarge
  | XXLarge
  | Smaller
  | Larger
  | FontSizeLength CSSLength

derive instance eqFontSize :: Eq FontSize

instance showFontSize :: Show FontSize where
  show = case _ of
    XXSmall -> "xx-small"
    XSmall -> "x-small"
    Small -> "small"
    Medium -> "medium"
    Large -> "large"
    XLarge -> "x-large"
    XXLarge -> "xx-large"
    Smaller -> "smaller"
    Larger -> "larger"
    FontSizeLength l -> printCSSLength l
-- This instance of Show is currently identical to printCSSLength. That is
-- likely to change so don't rely on it

printFontSize :: FontSize -> String
printFontSize = case _ of
  XXSmall -> "xx-small"
  XSmall -> "x-small"
  Small -> "small"
  Medium -> "medium"
  Large -> "large"
  XLarge -> "x-large"
  XXLarge -> "xx-large"
  Smaller -> "smaller"
  Larger -> "larger"
  FontSizeLength l -> printCSSLength l
