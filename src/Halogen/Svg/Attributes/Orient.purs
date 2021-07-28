module Halogen.Svg.Attributes.Orient
  ( Orient(..)
  , printOrient
  ) where

import Prelude

data Orient
  = AutoOrient
  | AutoStartReverse

derive instance eqOrient :: Eq Orient

instance showOrient :: Show Orient where
  show = case _ of
    AutoOrient       -> "auto"
    AutoStartReverse -> "auto-start-reverse"
-- This instance of Show is currently identical to printOrient. That is
-- likely to change so don't rely on it

printOrient :: Orient -> String
printOrient = case _ of
  AutoOrient       -> "auto"
  AutoStartReverse -> "auto-start-reverse"
