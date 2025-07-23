module Halogen.Svg.Attributes.Path
  ( PathCommand(..)
  , Path(..)
  , CommandPositionReference(..)
  , LargeArcFlag(..)
  , SweepFlag(..)
  , m, z
  , l, h, v
  , c, s
  , q, t
  , a
  ) where

import Prelude

import Data.String (joinWith)

data PathCommand
  = M Number Number CommandPositionReference
  | Z CommandPositionReference
  | L Number Number CommandPositionReference
  | H Number CommandPositionReference
  | V Number CommandPositionReference
  | C Number Number Number Number Number Number CommandPositionReference
  | S Number Number Number Number CommandPositionReference
  | Q Number Number Number Number CommandPositionReference
  | T Number Number CommandPositionReference
  | A Number Number Number LargeArcFlag SweepFlag Number Number CommandPositionReference

derive instance Eq PathCommand

instance Show PathCommand where
  show = case _ of
    M x y ref -> append (if ref==Abs then "M" else "m") $ addCommas
      [ show x, show y ]
    Z ref -> if ref==Abs then "Z" else "z"

    L x y ref -> append (if ref==Abs then "L" else "l") $ addCommas
      [ show x, show y ]
    H x ref -> append (if ref==Abs then "H" else "h") $ show x
    V y ref -> append (if ref==Abs then "V" else "v") $ show y

    C x1 y1 x2 y2 x y ref -> append (if ref==Abs then "C" else "c") $ addCommas
      [ show x1, show y1, show x2, show y2, show x, show y ]
    S x2 y2 x y ref -> append (if ref==Abs then "S" else "s") $ addCommas
      [ show x2, show y2, show x, show y ]
    
    Q x1 y1 x y ref -> append (if ref==Abs then "Q" else "q") $ addCommas
      [ show x1, show y1, show x, show y ]
    T x y ref -> append (if ref==Abs then "T" else "t") $ addCommas
      [ show x, show y ]

    A rx ry rot arc sweep x y ref -> append (if ref==Abs then "A" else "a") $ addCommas
      [ show rx, show ry, show rot, printLargeArcFlag arc, printSweepFlag sweep, show x, show y ]

    where
      addCommas :: Array String -> String
      addCommas = joinWith ","


newtype Path = Path (Array (CommandPositionReference -> PathCommand))

instance Show Path where
  show (Path commands) = joinWith " " (map (\c -> show (c Abs)) commands)


data CommandPositionReference = Rel | Abs

derive instance Eq CommandPositionReference

instance Show CommandPositionReference where
  show = case _ of
    Abs -> "Abs"
    Rel -> "Rel"

data LargeArcFlag = Arc0 | Arc1

derive instance Eq LargeArcFlag

instance Show LargeArcFlag where
  show = case _ of
    Arc0 -> "Arc0"
    Arc1 -> "Arc1"

printLargeArcFlag :: LargeArcFlag -> String
printLargeArcFlag = case _ of
  Arc0 -> "0"
  Arc1 -> "1"

-- | Sweep0 = Counter-Clockwise / Negative
-- | Sweep1 = Clockwise / Positive
data SweepFlag = Sweep0 | Sweep1

derive instance Eq SweepFlag

instance Show SweepFlag where
  show = case _ of
    Sweep0 -> "Sweep0"
    Sweep1 -> "Sweep1"

printSweepFlag :: SweepFlag -> String
printSweepFlag = case _ of
  Sweep0 -> "0"
  Sweep1 -> "1"


m :: Number -> Number -> (CommandPositionReference -> PathCommand)
m x y = const (M x y Rel)

z :: (CommandPositionReference -> PathCommand)
z = const (Z Rel)


l :: Number -> Number -> (CommandPositionReference -> PathCommand)
l x y = const (L x y Rel)

h :: Number -> (CommandPositionReference -> PathCommand)
h x = const (H x Rel)

v :: Number -> (CommandPositionReference -> PathCommand)
v y = const (V y Rel)


c :: Number -> Number -> Number -> Number -> Number -> Number -> (CommandPositionReference -> PathCommand)
c x1 y1 x2 y2 x y = const (C x1 y1 x2 y2 x y Rel)

s :: Number -> Number -> Number -> Number -> (CommandPositionReference -> PathCommand)
s x2 y2 x y = const (S x2 y2 x y Rel)


q :: Number -> Number -> Number -> Number -> (CommandPositionReference -> PathCommand)
q x1 y1 x y = const (Q x1 y1 x y Rel)

t :: Number -> Number -> (CommandPositionReference -> PathCommand)
t x y = const (T x y Rel)


a :: Number -> Number -> Number -> LargeArcFlag -> SweepFlag -> Number -> Number -> (CommandPositionReference -> PathCommand)
a rx ry rot arc sweep x y = const (A rx ry rot arc sweep x y Rel)
