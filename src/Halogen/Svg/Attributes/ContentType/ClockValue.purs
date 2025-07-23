module Halogen.Svg.Attributes.ContentType.ClockValue where
-- defined in https://developer.mozilla.org/en-US/docs/Web/SVG/Guides/Content_type#clock-value
-- 


import Prelude

import Data.Int as Int
import Data.Number as Number


newtype ClockValue = ClockValue { hours :: Int, minutes :: Int, seconds :: Number }

derive instance Eq ClockValue

instance Show ClockValue where
  show (ClockValue { hours, minutes, seconds }) = paddedHours <> ":" <> paddedMinutes <> ":" <> paddedSeconds
    where
      paddedHours = if hours < 10 then "0" <> show hours else show hours
      paddedMinutes = if minutes < 10 then "0" <> show minutes else show minutes
      paddedSeconds = if seconds < 10.0 then "0" <> show seconds else show seconds

instance Semigroup ClockValue where
  append (ClockValue c1) (ClockValue c2) = fullClock (c1.hours + c2.hours) (c1.minutes + c2.minutes) (c1.seconds + c2.seconds)

instance Monoid ClockValue where
  mempty = fullClock 0 0 0.0


fullClock :: Int -> Int -> Number -> ClockValue
fullClock h m s = ClockValue { hours, minutes, seconds }
  where 
    hours = h + (m `div` 60)
    minutes = m `mod` 60 + Int.floor (s / 60.0)
    seconds = s - Number.floor (s / 60.0) * 60.0 -- remove the minutes from the seconds, standard purescript `mod :: Number -> Number -> Number` is not what we want here


class ToClockValue a where
  hours :: a -> ClockValue
  minutes :: a -> ClockValue
  seconds :: a -> ClockValue
  milliseconds :: a -> ClockValue

instance ToClockValue Int where
  hours   h       = fullClock h 0 0.0
  minutes m       = fullClock 0 m 0.0
  seconds s       = fullClock 0 0 (Int.toNumber s)
  milliseconds ms = fullClock 0 0 ((Int.toNumber ms) / 1000.0)

instance ToClockValue Number where
  hours   h       = fullClock (Int.floor h) 0 0.0
  minutes m       = fullClock 0 (Int.floor m) 0.0
  seconds s       = fullClock 0 0 s
  milliseconds ms = fullClock 0 0 (ms / 1000.0)
