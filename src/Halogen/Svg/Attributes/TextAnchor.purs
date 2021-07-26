module Halogen.Svg.Attributes.TextAnchor
  ( TextAnchor(..)
  , printTextAnchor
  ) where

data TextAnchor
  = Start
  | AnchorMiddle
  | End

printTextAnchor :: TextAnchor -> String
printTextAnchor = case _ of
  Start        -> "start"
  AnchorMiddle -> "middle"
  End          -> "end"
