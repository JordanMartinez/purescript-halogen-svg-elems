module Halogen.Svg.Attributes.Masking where

import Prelude

import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.Svg.Attributes.ContentType.URL (URL)
import Halogen.Svg.Attributes.Filter (FilterUnits)
import Halogen.Svg.Attributes.HasClasses (class HasAuto, class HasInherit, class HasNone)
import Halogen.Svg.Attributes.Painting (FillRule)

data Overflow = OverflowVisible | OverflowHidden | OverflowScroll | OverflowAuto | OverflowInherit

instance Show Overflow where
  show = case _ of
    OverflowVisible -> "visible"
    OverflowHidden -> "hidden"
    OverflowScroll -> "scroll"
    OverflowAuto -> "auto"
    OverflowInherit -> "inherit"

instance HasAuto Overflow where
  auto = OverflowAuto

instance HasInherit Overflow where
  inherit = OverflowInherit


data ClippingRegion
  = ClipRect { top :: Number, right :: Number, bottom :: Number, left :: Number }
  | ClipAuto
  | ClipInherit

instance Show ClippingRegion where
  show = case _ of
    ClipRect { top, right, bottom, left } -> "rect(" <> show top <> " " <> show right <> " " <> show bottom <> " " <> show left <> ")"
    ClipAuto -> "auto"
    ClipInherit -> "inherit"

instance HasAuto ClippingRegion where
  auto = ClipAuto

instance HasInherit ClippingRegion where
  inherit = ClipInherit


data ClipPath = ClipPathURL URL | ClipPathNone | ClipPathInherit

instance Show ClipPath where
  show = case _ of
    ClipPathURL url -> show url
    ClipPathNone -> "none"
    ClipPathInherit -> "inherit"

instance HasNone ClipPath where
  none = ClipPathNone

instance HasInherit ClipPath where
  inherit = ClipPathInherit

class IsClipPath a where
  isClipPath :: a -> String

instance IsClipPath ClipPath where
  isClipPath = show
instance IsClipPath URL where
  isClipPath = show

-- | There are several opacity properties within SVG:
-- | 
-- | ‘fill-opacity’, which specifies the opacity of a fill operation;
-- | ‘stroke-opacity’, which specifies the opacity of a stroking operation;
-- | ‘stop-opacity’, which specifies the opacity of a gradient stop; and
-- | ‘opacity’, which specifies object/group opacity and which is described in this section.
class IsOpacity a where
  isOpacity :: a -> String


overflow :: forall r i. Overflow -> IProp ("overflow" :: String | r) i
overflow = attr (AttrName "overflow") <<< show

clip :: forall r i. ClippingRegion -> IProp ("clip" :: String | r) i
clip = attr (AttrName "clip") <<< show

clipPath :: forall a r i. IsClipPath a => a -> IProp ("clip-path" :: String | r) i
clipPath = attr (AttrName "clip-path") <<< isClipPath

clipRule :: forall r i. FillRule -> IProp ("clip-rule" :: String | r) i
clipRule = attr (AttrName "clip-rule") <<< show