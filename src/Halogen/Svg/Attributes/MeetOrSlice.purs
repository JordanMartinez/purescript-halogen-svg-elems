module Halogen.Svg.Attributes.MeetOrSlice
  ( MeetOrSlice(..)
  , printMeetOrSlice
  ) where

import Prelude

data MeetOrSlice
  = Meet
  | Slice

derive instance eqMeetOrSlice :: Eq MeetOrSlice

printMeetOrSlice :: MeetOrSlice -> String
printMeetOrSlice = case _ of
  Meet  -> "meet"
  Slice -> "slice"
