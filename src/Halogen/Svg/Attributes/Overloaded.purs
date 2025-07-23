module Halogen.Svg.Attributes.Overloaded where


 -- | This module is for attributes that have the same name but are semantically different.
 -- | It is used to overload the attribute name so that the correct attribute is used based on the context.
 -- | For example, the `rotate` attribute can be used to apply a rotation to an animation.

import Prelude

import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.Svg.Attributes.Text (class IsTextRotate, isTextRotate)
import Halogen.Svg.Attributes.Animate (AnimateMotionRotation, TransformType)
import Halogen.Svg.Attributes.Animate.Timing (TimingFill)
import Halogen.Svg.Attributes.ContentType.Paint (class IsPaint, isPaint)

-- attributes that have the same name but are semantically different go here vvv
class FillAttribute a where
  fill :: forall r i. a -> IProp ("fill" :: String | r) i

instance FillAttribute TimingFill where
  fill = attr (AttrName "fill") <<< show
else instance IsPaint a => FillAttribute a where
  fill = attr (AttrName "fill") <<< show <<< isPaint


class TypeAttribute a where
  type_ :: forall r i. a -> IProp ("type" :: String | r) i

instance TypeAttribute TransformType where
  type_ = attr (AttrName "type") <<< show


class RotateAttribute a where
  rotate :: forall r i. a -> IProp ("rotate" :: String | r) i

instance RotateAttribute AnimateMotionRotation where
  rotate = attr (AttrName "rotate") <<< show
else instance IsTextRotate a => RotateAttribute a where
  rotate = attr (AttrName "rotate") <<< isTextRotate