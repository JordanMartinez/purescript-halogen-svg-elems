module Halogen.Svg.Attributes.Baseline
  ( Baseline(..)
  , printBaseline
  ) where

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
