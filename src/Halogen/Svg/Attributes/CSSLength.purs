module Halogen.Svg.Attributes.CSSLength
  ( CSSLength(..)
  , printCSSLength
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

derive instance eqCSSLength :: Eq CSSLength

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
{- The documentation for Show says "While not required, it is recommended that for any expression x, the string show x be executable PureScript code which evaluates to the same value as the expression x." The instance of Show above predates the use of printCSSLength and does not follow that recommendation. This may be changed in a future version and `show` when generating SVG is depreciated. Use printCSSLength instead.
-}

printCSSLength :: CSSLength -> String
printCSSLength = case _ of
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
