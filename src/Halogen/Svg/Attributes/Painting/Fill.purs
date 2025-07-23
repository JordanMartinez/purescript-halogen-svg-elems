module Halogen.Svg.Attributes.Painting.Fill where

import Prelude

import Data.Foldable (fold, foldMap)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.Svg.Attributes.ContentType (Color(..))
import Halogen.Svg.Attributes.ContentType.URL (URL(..))
import Halogen.Svg.Attributes.HasClasses (class HasNone)


data FillRule = NonZero | EvenOdd

instance Show FillRule where
  show = case _ of
    NonZero -> "nonzero"
    EvenOdd -> "evenodd"

fillRule :: forall r i. FillRule -> IProp ("fill-rule" :: String | r) i
fillRule = attr (AttrName "fill-rule") <<< show

fillOpacity :: forall r i. Number -> IProp ("fill-opacity" :: String | r) i
fillOpacity = attr (AttrName "fill-opacity") <<< show

