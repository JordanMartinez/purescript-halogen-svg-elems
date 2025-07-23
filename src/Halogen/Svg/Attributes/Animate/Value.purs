module Halogen.Svg.Attributes.Animate.Value where

import Prelude

import Data.String (joinWith)
import Halogen.HTML.Properties (IProp(..), attr)
import Web.HTML.Common (AttrName(..))

data CalcMode = Discrete | Linear | Paced | Spline

instance Show CalcMode where
  show = case _ of
    Discrete -> "discrete"
    Linear -> "linear"
    Paced -> "paced"
    Spline -> "spline"

calcMode :: forall p i. CalcMode -> IProp ("calcMode" :: String | p) i
calcMode = attr (AttrName "calcMode") <<< show

values :: forall p i a. Show a => Array a -> IProp ("values" :: String | p) i
values = attr (AttrName "values") <<< joinWith "; " <<< map show

keyTimes :: forall p i. Array Number -> IProp ("keyTimes" :: String | p) i
keyTimes = attr (AttrName "keyTimes") <<< joinWith "; " <<< map show

keySplines :: forall p i. Array Number -> IProp ("keySplines" :: String | p) i
keySplines = attr (AttrName "keySplines") <<< joinWith "; " <<< map show

from :: forall p i a. Show a => a -> IProp ("from" :: String | p) i
from = attr (AttrName "from") <<< show

to :: forall p i a. Show a => a -> IProp ("to" :: String | p) i
to = attr (AttrName "to") <<< show

by :: forall p i a. Show a => a -> IProp ("by" :: String | p) i
by = attr (AttrName "by") <<< show