module Halogen.Svg.Attributes.Coords where

import Prelude

import Data.Tuple (Tuple(..))
import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.ContentType.Transform (class IsTransform, isTransform)
import Halogen.Svg.Attributes.HasClasses (class HasDefault, class HasNone)
import Web.HTML.Common (AttrName(..))

data MeetOrSlice = Meet | Slice

derive instance Eq MeetOrSlice

instance Show MeetOrSlice where
  show = case _ of
    Meet -> "meet"
    Slice -> "slice"


data Align
  = AlignNone
  | XMinYMin
  | XMidYMin
  | XMaxYMin
  | XMinYMid
  | XMidYMid
  | XMaxYMid
  | XMinYMax
  | XMidYMax
  | XMaxYMax

derive instance Eq Align

instance Show Align where
  show = case _ of
    AlignNone -> "none"
    XMinYMin -> "xMinYMin"
    XMidYMin -> "xMidYMin"
    XMaxYMin -> "xMaxYMin"
    XMinYMid -> "xMinYMid"
    XMidYMid -> "xMidYMid"
    XMaxYMid -> "xMaxYMid"
    XMinYMax -> "xMinYMax"
    XMidYMax -> "xMidYMax"
    XMaxYMax -> "xMaxYMax"

class IsPreserveAspectRatio a where
  isPreserveAspectRatio :: a -> String

instance IsPreserveAspectRatio Align where
  isPreserveAspectRatio = show

instance IsPreserveAspectRatio (Tuple Align MeetOrSlice) where
  isPreserveAspectRatio (Tuple align meetOrSlice) = show align <> " " <> show meetOrSlice

instance HasNone Align where
  none = AlignNone


data VectorEffect
  = VectorEffectNone
  | NonScalingStroke
  | NonScalingSize
  | NonRotation
  | FixedRotation

derive instance Eq VectorEffect

instance Show VectorEffect where
  show = case _ of
    VectorEffectNone -> "none"
    NonScalingStroke -> "non-scaling-stroke"
    NonScalingSize -> "non-scaling-size"
    NonRotation -> "non-rotation"
    FixedRotation -> "fixed-rotation"

instance HasNone VectorEffect where
  none = VectorEffectNone

instance HasDefault VectorEffect where
  default = VectorEffectNone

viewBox :: forall r i. Number -> Number -> Number -> Number -> IProp (viewBox :: String | r) i
viewBox minx miny width height = attr (AttrName "viewBox") $
  show minx <> " " <> show miny <> " " <> show width <> " " <> show height

preserveAspectRatio :: forall r i. MeetOrSlice -> IProp (preserveAspectRatio :: String | r) i
preserveAspectRatio = attr (AttrName "preserveAspectRatio") <<< show

vectorEffect :: forall r i. VectorEffect -> IProp (vectorEffect :: String | r) i
vectorEffect = attr (AttrName "vectorEffect") <<< show

transform :: forall a r i. IsTransform a => a -> IProp (transform :: String | r) i
transform = attr (AttrName "transform") <<< isTransform