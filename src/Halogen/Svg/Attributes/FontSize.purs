module Halogen.Svg.Attributes.FontSize
  ( FontSize(..)
  ) where

import Prelude
import Halogen.Svg.Attributes.CSSLength (CSSLength)

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
    FontSizeLength l -> show l
