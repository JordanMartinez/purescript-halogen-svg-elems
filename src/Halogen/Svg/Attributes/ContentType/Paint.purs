module Halogen.Svg.Attributes.ContentType.Paint where

import Prelude

import Data.Foldable (foldMap)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Halogen.Svg.Attributes.ContentType.Color (Color(..))
import Halogen.Svg.Attributes.ContentType.URL (URL(..))
import Halogen.Svg.Attributes.HasClasses (class HasNone)

data Paint
  = PaintNone
  | PaintUrl URL (Maybe Color)
  | PaintColor Color
  | PaintContextFill
  | PaintContextStroke

instance Show Paint where
  show = case _ of
    PaintNone -> "none"
    PaintUrl url maybeColor -> show url <> foldMap (\color -> " " <> show color) maybeColor
    PaintColor color -> show color
    PaintContextFill -> "context-fill"
    PaintContextStroke -> "context-stroke"

instance HasNone Paint where
  none = PaintNone


class IsPaint a where
  isPaint :: a -> Paint

instance IsPaint URL where
  isPaint url = PaintUrl url Nothing

instance IsPaint (Tuple URL Color) where
  isPaint (Tuple url color) = PaintUrl url (Just color)

instance IsPaint Color where
  isPaint = PaintColor

instance IsPaint Paint where
  isPaint = identity

instance IsPaint String where
  isPaint namedColor = PaintColor (Named namedColor)