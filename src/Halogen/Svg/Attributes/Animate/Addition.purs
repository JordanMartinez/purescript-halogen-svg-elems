module Halogen.Svg.Attributes.Animate.Addition where

import Prelude

import Halogen.HTML (AttrName(..), IProp, attr)

data Additive = AdditiveSum | AdditiveReplace

instance Show Additive where
  show = case _ of
    AdditiveSum -> "sum"
    AdditiveReplace -> "replace"


data Accumulate = AccumulateSum | AccumulateNone

instance Show Accumulate where
  show = case _ of
    AccumulateSum -> "sum"
    AccumulateNone -> "none"


additive :: forall r i. Additive -> IProp (additive :: String | r) i
additive = attr (AttrName "additive") <<< show

accumulate :: forall r i. Accumulate -> IProp (accumulate :: String | r) i
accumulate = attr (AttrName "accumulate") <<< show