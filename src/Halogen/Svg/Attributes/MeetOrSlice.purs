module Halogen.Svg.Attributes.MeetOrSlice
  ( MeetOrSlice(..)
  , printMeetOrSlice
  ) where

import Prelude

data MeetOrSlice
  = Meet
  | Slice

derive instance eqMeetOrSlice :: Eq MeetOrSlice

instance showMeetOrSlice :: Show MeetOrSlice where
  show = case _ of
    Meet -> "Meet"
    Slice -> "Slice"

printMeetOrSlice :: MeetOrSlice -> String
printMeetOrSlice = case _ of
  Meet  -> "meet"
  Slice -> "slice"
