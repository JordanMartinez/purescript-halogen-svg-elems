module Halogen.Svg.Attributes.ContentType.Length
  ( Length(..)
  , class ToLength
  , toLength
  ) where

import Prelude

import Data.Int as Int

data Length
  = Cm Number
  | Mm Number
  | Inches Number
  | Px Number
  | Pt Number
  | Pc Number
  | Em Number
  | Ex Number
  | Rem Number
  | Vw Number
  | Vh Number
  | Vmin Number
  | Vmax Number
  | Pct Number
  | NoCSSLength

derive instance eqLength :: Eq Length

instance showLength :: Show Length where
  show = case _ of
    Cm i -> show i <> "cm"
    Mm i -> show i <> "mm"
    Inches i -> show i <> "in"
    Px i -> show i <> "px"
    Pt i -> show i <> "pt"
    Pc i -> show i <> "pc"
    Em i -> show i <> "em"
    Ex i -> show i <> "ex"
    Rem i -> show i <> "rem"
    Vw i -> show i <> "vw"
    Vh i -> show i <> "vh"
    Vmin i -> show i <> "vmin"
    Vmax i -> show i <> "vmax"
    Pct i -> show i <> "%"
    NoCSSLength -> "0"

class ToLength a where
  toLength :: a -> Length

instance ToLength Int where
  toLength = Px <<< Int.toNumber

instance ToLength Number where
  toLength = Px

instance ToLength Length where
  toLength = identity