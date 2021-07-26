module Halogen.Svg.Attributes.Path
  ( PathCommand -- Constructor not exported. Use m, l, h, v, c, s, q, t, a, or z
  , CommandPositionReference(..)
  , CommandArcChoice(..)
  , CommandSweepChoice(..)
  , m, l, h, v, c, s, q, t, a, z
  ) where

import Prelude
import Data.String (toUpper)
import Halogen.Svg.Attributes.Utils (printArray)

newtype PathCommand = PathCommand String

derive instance eqPathCommand :: Eq PathCommand

instance showPathCommand :: Show PathCommand where
  show val = printPathCommand val

printPathCommand :: PathCommand -> String
printPathCommand (PathCommand s_) = s_

data CommandPositionReference = Rel | Abs

derive instance eqCommandPositionReference :: Eq CommandPositionReference

instance showCommandPositionReference :: Show CommandPositionReference where
  show = case _ of
    Abs -> "Abs"
    Rel -> "Rel"

-- | Arc0 = Small arc
-- | Arc1 = Large arc
data CommandArcChoice = Arc0 | Arc1

derive instance eqCommandArcChoice :: Eq CommandArcChoice

instance showCommandArcChoice :: Show CommandArcChoice where
  show = case _ of
    Arc0 -> "Arc0"
    Arc1 -> "Arc1"

printCommandArcChoice :: CommandArcChoice -> String
printCommandArcChoice = case _ of
  Arc0 -> "0"
  Arc1 -> "1"

-- | Sweep0 = Counter-Clockwise / Negative
-- | Sweep1 = Clockwise / Positive
data CommandSweepChoice = Sweep0 | Sweep1

derive instance eqCommandSweepChoice :: Eq CommandSweepChoice

instance showCommandSweepChoice :: Show CommandSweepChoice where
  show = case _ of
    Sweep0 -> "Sweep0"
    Sweep1 -> "Sweep1"

printCommandSweepChoice :: CommandSweepChoice -> String
printCommandSweepChoice = case _ of
  Sweep0 -> "0"
  Sweep1 -> "1"

-- For internal use. Do not export.
renderCommand :: CommandPositionReference -> String -> String
renderCommand cmd s_ = case cmd of
  Rel -> s_
  Abs -> toUpper s_

m :: CommandPositionReference -> Number -> Number -> PathCommand
m = renderCommand2Args "m"

l :: CommandPositionReference -> Number -> Number -> PathCommand
l = renderCommand2Args "l"

h :: CommandPositionReference -> Number -> PathCommand
h = renderCommand1Arg "h"

v :: CommandPositionReference -> Number -> PathCommand
v = renderCommand1Arg "v"

c :: CommandPositionReference -> Number -> Number -> Number -> Number ->
     Number -> Number -> PathCommand
c ref x1_ y1_ x2_ y2_ x_ y_ =
  PathCommand $ renderCommand ref "c" <> printArray [x1_, y1_, x2_, y2_, x_, y_]

s :: CommandPositionReference -> Number -> Number -> Number -> Number ->
     PathCommand
s = renderCommand4Args "s"

q :: CommandPositionReference -> Number -> Number -> Number -> Number ->
     PathCommand
q = renderCommand4Args "q"

t :: CommandPositionReference -> Number -> Number -> PathCommand
t = renderCommand2Args "t"

a :: CommandPositionReference -> Number -> Number -> Number ->
     CommandArcChoice -> CommandSweepChoice -> Number -> Number -> PathCommand
a ref rx_ ry_ rot arc sweep x_ y_ = PathCommand $
  renderCommand ref "a" <>
  show rx_ <> ", " <>
  show ry_ <> ", " <>
  show rot <> " " <>
  printCommandArcChoice arc <> " " <>
  printCommandSweepChoice sweep <> " " <>
  show x_ <> " " <>
  show y_

z :: PathCommand
z = PathCommand "z"

-- For internal use. Do not export.
renderCommand1Arg :: String -> CommandPositionReference -> Number -> PathCommand
renderCommand1Arg s_ ref a_ = PathCommand $ (renderCommand ref s_) <> show a_

-- For internal use. Do not export.
renderCommand2Args ::
  String -> CommandPositionReference -> Number -> Number -> PathCommand
renderCommand2Args s_ ref a_ b =
  PathCommand $ (renderCommand ref s_) <> show a_ <> ", " <> show b

-- For internal use. Do not export.
renderCommand4Args :: String -> CommandPositionReference -> Number -> Number ->
                      Number -> Number -> PathCommand
renderCommand4Args s_ ref a_ b c_ d_ =
  PathCommand $ (renderCommand ref s_) <>
    show a_ <> ", " <> show b <> ", " <> show c_ <> ", " <> show d_
