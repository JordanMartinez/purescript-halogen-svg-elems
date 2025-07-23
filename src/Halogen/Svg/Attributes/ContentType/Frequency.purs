module Halogen.Svg.Attributes.ContentType.Frequency where

import Prelude

data Frequency
  = Hz Number
  | KHz Number

frequencyHz :: Number -> Frequency
frequencyHz = Hz

frequencyKHz :: Number -> Frequency
frequencyKHz = KHz

derive instance Eq Frequency

instance Show Frequency where
  show = case _ of
    Hz i -> "(Hz " <> show i <> ")"
    KHz i -> "(KHz " <> show i <> ")"