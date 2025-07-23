module Halogen.Svg.Attributes.Animate.Timing where

import Prelude

import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.Animate.Trigger (class IsAnimationTrigger, isAnimationTrigger)
import Halogen.Svg.Attributes.ContentType.ClockValue (ClockValue)
import Web.HTML.Common (AttrName(..))

data Duration = DurationClockValue ClockValue | Media | Indefinite

instance Show Duration where
  show = case _ of
    DurationClockValue clockValue -> show clockValue
    Media -> "media"
    Indefinite -> "indefinite"

class IsDuration a where
  isDuration :: a -> String

instance IsDuration ClockValue where
  isDuration = show

instance IsDuration Duration where
  isDuration = show


data TimingLimit
  = TimingLimitClockValue ClockValue
  | TimingLimitIndefinite

instance Show TimingLimit where
  show = case _ of
    TimingLimitClockValue clockValue -> show clockValue
    TimingLimitIndefinite -> "indefinite"


class IsTimingLimit a where
  isTimingLimit :: a -> String

instance IsTimingLimit ClockValue where
  isTimingLimit = show

instance IsTimingLimit TimingLimit where
  isTimingLimit = show


data TimingFill = TimingFillFreeze | TimingFillRemove

instance Show TimingFill where
  show = case _ of
    TimingFillFreeze -> "freeze"
    TimingFillRemove -> "remove"


data RepeatCount = RepeatCountIndefinite | RepeatCountNumber Number

instance Show RepeatCount where
  show = case _ of
    RepeatCountIndefinite -> "indefinite"
    RepeatCountNumber number -> show number

class IsRepeatCount a where
  isRepeatCount :: a -> String

instance IsRepeatCount Number where
  isRepeatCount = show

instance IsRepeatCount RepeatCount where
  isRepeatCount = show

begin :: forall p i a. IsAnimationTrigger a => a -> IProp ("begin" :: String | p) i
begin = attr (AttrName "begin") <<< isAnimationTrigger

dur :: forall p i a. IsDuration a => a -> IProp ("dur" :: String | p) i
dur = attr (AttrName "dur") <<< isDuration

end :: forall p i a. IsAnimationTrigger a => a -> IProp ("end" :: String | p) i
end = attr (AttrName "end") <<< isAnimationTrigger

minValue :: forall p i a. IsTimingLimit a => a -> IProp ("min" :: String | p) i
minValue = attr (AttrName "min") <<< isTimingLimit

maxValue :: forall p i a. IsTimingLimit a => a -> IProp ("max" :: String | p) i
maxValue = attr (AttrName "max") <<< isTimingLimit

restart :: forall p i. Number -> IProp ("restart" :: String | p) i
restart = attr (AttrName "restart") <<< show

repeatCount :: forall p i a. IsRepeatCount a => a -> IProp ("repeatCount" :: String | p) i
repeatCount = attr (AttrName "repeatCount") <<< isRepeatCount

repeatDur :: forall p i a. IsTimingLimit a => a -> IProp ("repeatDur" :: String | p) i
repeatDur = attr (AttrName "repeatDur") <<< isTimingLimit