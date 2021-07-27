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

instance showTextAnchor :: Show TextAnchor where
  show = case _ of
    Start        -> "Start"
    AnchorMiddle -> "AnchorMiddle"
    End          -> "End"

printTextAnchor :: TextAnchor -> String
printTextAnchor = case _ of
  Start        -> "start"
  AnchorMiddle -> "middle"
  End          -> "end"
