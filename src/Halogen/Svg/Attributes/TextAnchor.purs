module Halogen.Svg.Attributes.TextAnchor
  ( TextAnchor(..)
  , printTextAnchor
  ) where

import Prelude

data TextAnchor
  = Start
  | AnchorMiddle
  | End

derive instance eqTextAnchor :: Eq TextAnchor

printTextAnchor :: TextAnchor -> String
printTextAnchor = case _ of
  Start        -> "start"
  AnchorMiddle -> "middle"
  End          -> "end"
