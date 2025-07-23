module Halogen.Svg.Attributes.Animate (
  AttributeType(..),
  TransformType(..),
  AnimateMotionRotation(..),
  attributeName,
  attributeType,
  path,
  module Halogen.Svg.Attributes.Animate.Addition,
  module Halogen.Svg.Attributes.Animate.Value,
  module Halogen.Svg.Attributes.Animate.Trigger,
  module Halogen.Svg.Attributes.Animate.Timing
) where

import Halogen.Svg.Attributes.Animate.Addition
import Halogen.Svg.Attributes.Animate.Timing
import Halogen.Svg.Attributes.Animate.Trigger
import Halogen.Svg.Attributes.Animate.Value
import Prelude

import Data.String (joinWith)
import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.Svg.Attributes.Animate.Trigger (class IsAnimationTrigger, isAnimationTrigger)
import Halogen.Svg.Attributes.ContentType.ClockValue (ClockValue)
import Halogen.Svg.Attributes.HasClasses (class HasAuto)
import Halogen.Svg.Attributes.Paths (class IsPathShape, isPathShape)
import Halogen.Svg.Indexed.Animate (SVGanimate)
import Web.HTML.Common (AttrName(..))

data AttributeType = AttributeTypeXML | AttributeTypeCSS | AttributeTypeAuto

instance Show AttributeType where
  show = case _ of
    AttributeTypeXML -> "XML"
    AttributeTypeCSS -> "CSS"
    AttributeTypeAuto -> "auto"

instance HasAuto AttributeType where
  auto = AttributeTypeAuto


data TransformType
  = TransformTypeTranslate 
  | TransformTypeScale 
  | TransformTypeRotate
  | TransformTypeSkewX 
  | TransformTypeSkewY 

instance Show TransformType where
  show = case _ of
    TransformTypeTranslate -> "translate"
    TransformTypeScale -> "scale"
    TransformTypeRotate -> "rotate"
    TransformTypeSkewX -> "skewX"
    TransformTypeSkewY -> "skewY"


data AnimateMotionRotation 
  = AnimateMotionRotationAuto
  | AnimateMotionRotationAutoReverse
  | AnimateMotionRotationNumber Number

instance Show AnimateMotionRotation where
  show = case _ of
    AnimateMotionRotationAuto -> "auto"
    AnimateMotionRotationAutoReverse -> "auto-reverse"
    AnimateMotionRotationNumber number -> show number

instance HasAuto AnimateMotionRotation where
  auto = AnimateMotionRotationAuto

attributeName :: forall p i. String -> IProp ("attributeName" :: String | p) i
attributeName = attr (AttrName "attributeName")

attributeType :: forall p i. AttributeType -> IProp ("attributeType" :: String | p) i
attributeType = attr (AttrName "attributeType") <<< show

path :: forall a p i. IsPathShape a => a -> IProp ("path" :: String | p) i
path = attr (AttrName "path") <<< isPathShape