module Halogen.Svg.Attributes.Text where

import Prelude

import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.ContentType (class IsLengthPercentageNumber, isLengthPercentageNumber)
import Halogen.Svg.Attributes.ContentType.URL (URL(..))
import Halogen.Svg.Attributes.HasClasses (class HasDefault)
import Web.HTML.Common (AttrName(..))

class IsTextRotate a where
  isTextRotate :: a -> String

instance IsTextRotate Int where
  isTextRotate = show

instance IsTextRotate Number where
  isTextRotate = show

instance IsTextRotate a => IsTextRotate (Array a) where
  isTextRotate = joinWith " " <<< map isTextRotate


data LengthAdjust = LengthAdjustSpacing | LengthAdjustSpacingAndGlyphs

instance HasDefault LengthAdjust where
  default = LengthAdjustSpacing

instance Show LengthAdjust where
  show = case _ of
    LengthAdjustSpacing -> "spacing"
    LengthAdjustSpacingAndGlyphs -> "spacingAndGlyphs"


data TextAnchor = TextAnchorStart | TextAnchorMiddle | TextAnchorEnd

instance HasDefault TextAnchor where
  default = TextAnchorStart

instance Show TextAnchor where
  show = case _ of
    TextAnchorStart -> "start"
    TextAnchorMiddle -> "middle"
    TextAnchorEnd -> "end"


href :: forall r i. URL -> IProp (href :: String | r) i
href (URL url) = attr (AttrName "href") url

textLength :: forall a r i. IsLengthPercentageNumber a => a -> IProp (textLength :: String | r) i
textLength = attr (AttrName "textLength") <<< isLengthPercentageNumber

lengthAdjust :: forall r i. LengthAdjust -> IProp (lengthAdjust :: String | r) i
lengthAdjust = attr (AttrName "lengthAdjust") <<< show

textAnchor :: forall r i. TextAnchor -> IProp ("text-anchor" :: String | r) i
textAnchor = attr (AttrName "text-anchor") <<< show
