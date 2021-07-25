module Halogen.Svg.Attributes.CSSLength
  ( CSSLength(..)
  ) where

import Prelude

data CSSLength
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
  | Nil

instance showCSSLength :: Show CSSLength where
  show = case _ of
    Cm i     -> show i <> "cm"
    Mm i     -> show i <> "mm"
    Inches i -> show i <> "in"
    Px i     -> show i <> "px"
    Pt i     -> show i <> "pt"
    Pc i     -> show i <> "pc"
    Em i     -> show i <> "em"
    Ex i     -> show i <> "ex"
    Rem i    -> show i <> "rem"
    Vw i     -> show i <> "vw"
    Vh i     -> show i <> "vh"
    Vmin i   -> show i <> "vmin"
    Vmax i   -> show i <> "vmax"
    Pct i    -> show i <> "%"
    Nil      -> "0"
