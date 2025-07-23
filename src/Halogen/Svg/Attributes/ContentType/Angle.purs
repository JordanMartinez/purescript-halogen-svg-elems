module Halogen.Svg.Attributes.ContentType.Angle where

import Prelude

data Angle
  = Degrees Number
  | Gradians Number
  | Radians Number

derive instance Eq Angle

instance Show Angle where
  show = case _ of
    Degrees i -> show i <> " deg"
    Gradians i -> show i <> " grad"
    Radians i -> show i <> " rad"

class ToAngle a where
  toAngle :: a -> Angle

instance ToAngle Number where 
  toAngle = Degrees

instance ToAngle Angle where
  toAngle = identity