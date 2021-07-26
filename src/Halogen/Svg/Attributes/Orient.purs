module Halogen.Svg.Attributes.Orient
  ( Orient(AutoOrient, AutoStartReverse)
  , printOrient
  ) where

import Prelude

data Orient
  = AutoOrient
  | AutoStartReverse

instance showOrient :: Show Orient where
  show = case _ of
    AutoOrient       -> "auto"
    AutoStartReverse -> "auto-start-reverse"

printOrient :: Orient -> String
printOrient = case _ of
  AutoOrient       -> "auto"
  AutoStartReverse -> "auto-start-reverse"
