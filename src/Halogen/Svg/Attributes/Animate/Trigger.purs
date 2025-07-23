module Halogen.Svg.Attributes.Animate.Trigger where

import Prelude

import Data.String (joinWith)
import Data.Tuple.Nested (type (/\), (/\))
import Halogen.Svg.Attributes.ContentType.ClockValue (ClockValue)
import Web.Event.Event (EventType(..))

data OffsetValue = NegativeOffset ClockValue | PositiveOffset ClockValue

instance Show OffsetValue where
  show = case _ of
    NegativeOffset clockValue -> "-" <> show clockValue
    PositiveOffset clockValue -> "+" <> show clockValue

class IsOffsetValue a where
  isOffsetValue :: a -> String
instance IsOffsetValue ClockValue where
  isOffsetValue = show
instance IsOffsetValue OffsetValue where
  isOffsetValue = show


data SyncbaseValue = SyncBegin String | SyncEnd String

instance Show SyncbaseValue where
  show = case _ of
    SyncBegin idValue -> idValue <> ".begin"
    SyncEnd idValue -> idValue <> ".end"


newtype RepeatValue = RepeatValue Int

instance Show RepeatValue where
  show (RepeatValue repeat) = "repeat(" <> show repeat <> ")"

newtype AccessKeyValue = AccessKeyValue String

instance Show AccessKeyValue where
  show (AccessKeyValue accessKeyValue) = "accesskey(" <> accessKeyValue <> ")"


newtype WallClockValue = WallClockValue String

instance Show WallClockValue where
  show (WallClockValue wallClockValue) = "wallclock(" <> wallClockValue <> ")"


data IndefiniteValue = IndefiniteValue

instance Show IndefiniteValue where
  show IndefiniteValue = "indefinite"


class IsAnimationTrigger a where
  isAnimationTrigger :: a -> String

-- offset triggers
instance IsAnimationTrigger ClockValue where
  isAnimationTrigger = isOffsetValue
instance IsAnimationTrigger OffsetValue where
  isAnimationTrigger = isOffsetValue

-- syncbase triggers
instance IsAnimationTrigger SyncbaseValue where
  isAnimationTrigger = show
instance IsOffsetValue a => IsAnimationTrigger (SyncbaseValue /\ a) where
  isAnimationTrigger (syncbaseValue /\ offset) = isAnimationTrigger syncbaseValue <> isOffsetValue offset

-- event based triggers
instance IsAnimationTrigger EventType where
  isAnimationTrigger (EventType eventType) = show eventType
instance IsAnimationTrigger (String /\ EventType) where
  isAnimationTrigger (idValue /\ eventType) = idValue <> "." <> isAnimationTrigger eventType
instance IsOffsetValue a => IsAnimationTrigger (EventType /\ a) where
  isAnimationTrigger (eventType /\ offset) = isAnimationTrigger eventType <> isOffsetValue offset
instance IsOffsetValue a => IsAnimationTrigger (String /\ EventType /\ a) where
  isAnimationTrigger (idValue /\ eventType /\ offset) =
    idValue <> "." <> isAnimationTrigger eventType <> isOffsetValue offset

-- repeat triggers
instance IsAnimationTrigger RepeatValue where
  isAnimationTrigger = show
instance IsAnimationTrigger (String /\ RepeatValue) where
  isAnimationTrigger (idValue /\ repeat) = idValue <> "." <> isAnimationTrigger repeat
instance IsOffsetValue a => IsAnimationTrigger (RepeatValue /\ a) where
  isAnimationTrigger (repeat /\ offset) = isAnimationTrigger repeat <> isOffsetValue offset
instance IsOffsetValue a => IsAnimationTrigger (String /\ RepeatValue /\ a) where
  isAnimationTrigger (idValue /\ repeat /\ offset) =
    idValue <> "." <> isAnimationTrigger repeat <> isOffsetValue offset

-- access key triggers
instance IsAnimationTrigger AccessKeyValue where
  isAnimationTrigger = show

-- wallclock sync triggers
instance IsAnimationTrigger WallClockValue where
  isAnimationTrigger = show

-- indefinite triggers
instance IsAnimationTrigger IndefiniteValue where
  isAnimationTrigger = show

-- combination of triggers
instance IsAnimationTrigger a => IsAnimationTrigger (Array a) where
  isAnimationTrigger = joinWith "; " <<< map isAnimationTrigger

