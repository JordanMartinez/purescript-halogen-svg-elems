module Halogen.Svg.Attributes.MeetOrSlice
  ( MeetOrSlice (Meet, Slice)
  , printMeetOrSlice
  ) where

data MeetOrSlice
  = Meet
  | Slice

printMeetOrSlice :: MeetOrSlice -> String
printMeetOrSlice = case _ of
  Meet  -> "meet"
  Slice -> "slice"
