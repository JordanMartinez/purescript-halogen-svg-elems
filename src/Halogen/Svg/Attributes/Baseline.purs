module Halogen.Svg.Attributes.Baseline
  ( Baseline(..)
  , printBaseline
  ) where

import Prelude

data Baseline
  = Auto
  | UseScript
  | NoChange
  | ResetSize
  | Ideographic
  | Alphabetic
  | Hanging
  | Mathematical
  | Central
  | BaselineMiddle
  | TextAfterEdge
  | TextBeforeEdge

derive instance eqBaseline :: Eq Baseline

instance showBaseline :: Show Baseline where
  show = case _ of
    Auto           -> "Auto"
    UseScript      -> "UseScript"
    NoChange       -> "NoChange"
    ResetSize      -> "ResetSize"
    Ideographic    -> "Ideographic"
    Alphabetic     -> "Alphabetic"
    Hanging        -> "Hanging"
    Mathematical   -> "Mathematical"
    Central        -> "Central"
    BaselineMiddle -> "BaselineMiddle"
    TextAfterEdge  -> "TextAfterEdge"
    TextBeforeEdge -> "TextBeforeEdge"

printBaseline :: Baseline -> String
printBaseline = case _ of
  Auto           -> "auto"
  UseScript      -> "use-script"
  NoChange       -> "no-change"
  ResetSize      -> "reset-size"
  Ideographic    -> "ideographic"
  Alphabetic     -> "alphabetic"
  Hanging        -> "hanging"
  Mathematical   -> "mathematical"
  Central        -> "central"
  BaselineMiddle -> "middle"
  TextAfterEdge  -> "text-after-edge"
  TextBeforeEdge -> "text-before-edge"
