module Halogen.Svg.Attributes.Painting.Stroke where

import Prelude

import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.Svg.Attributes.ContentType (class IsLengthPercentageNumber, isLengthPercentageNumber)
import Halogen.Svg.Attributes.ContentType.Color (Color)
import Halogen.Svg.Attributes.ContentType.Length (Length)
import Halogen.Svg.Attributes.ContentType.Paint (class IsPaint, isPaint)
import Halogen.Svg.Attributes.ContentType.Percentage (Percentage(..), printPercentage)




data StrokeLineCap = StrokeLineCapButt | StrokeLineCapRound | StrokeLineCapSquare

instance Show StrokeLineCap where
  show = case _ of
    StrokeLineCapButt -> "butt"
    StrokeLineCapRound -> "round"
    StrokeLineCapSquare -> "square"


data StrokeLineJoin = StrokeLineJoinMiter | StrokeLineJoinMiterClip | StrokeLineJoinRound | StrokeLineJoinBevel | StrokeLineJoinArcs

instance Show StrokeLineJoin where
  show = case _ of
    StrokeLineJoinMiter -> "miter"
    StrokeLineJoinMiterClip -> "miter-clip"
    StrokeLineJoinRound -> "round"
    StrokeLineJoinBevel -> "bevel"
    StrokeLineJoinArcs -> "arcs"




class IsDashArray a where
  isDashArray :: a -> String

instance IsDashArray a => IsDashArray (Array a) where
  isDashArray = joinWith "," <<< map isDashArray
else instance (IsDashArray a, IsDashArray b) => IsDashArray (Tuple a b) where
  isDashArray (Tuple a b) = isDashArray a <> "," <> isDashArray b
else instance IsLengthPercentageNumber a => IsDashArray a where
  isDashArray = isLengthPercentageNumber


class IsStrokeDashOffset a where
  isStrokeDashOffset :: a -> String

instance IsStrokeDashOffset Length where
  isStrokeDashOffset = show

instance IsStrokeDashOffset Percentage where
  isStrokeDashOffset = printPercentage

instance IsStrokeDashOffset Number where
  isStrokeDashOffset = show







stroke :: forall a r i. IsPaint a => a -> IProp ("stroke" :: String | r) i
stroke = attr (AttrName "stroke") <<< show <<< isPaint

strokeWidth :: forall a r i. IsLengthPercentageNumber a => a -> IProp ("stroke-width" :: String | r) i
strokeWidth = attr (AttrName "stroke-width") <<< isLengthPercentageNumber

strokeLineCap :: forall r i. StrokeLineCap -> IProp ("stroke-linecap" :: String | r) i
strokeLineCap = attr (AttrName "stroke-linecap") <<< show

strokeLineJoin :: forall r i. StrokeLineJoin -> IProp ("stroke-linejoin" :: String | r) i
strokeLineJoin = attr (AttrName "stroke-linejoin") <<< show

strokeMiterLimit :: forall r i. Number -> IProp ("stroke-miterlimit" :: String | r) i
strokeMiterLimit = attr (AttrName "stroke-miterlimit") <<< show



strokeDashOffset :: forall a r i. IsStrokeDashOffset a => a -> IProp ("stroke-dashoffset" :: String | r) i
strokeDashOffset = attr (AttrName "stroke-dashoffset") <<< isStrokeDashOffset

strokeOpacity :: forall r i. Number -> IProp ("stroke-opacity" :: String | r) i
strokeOpacity = attr (AttrName "stroke-opacity") <<< show

strokeDashArray :: forall a r i. IsDashArray a => a -> IProp ("stroke-dasharray" :: String | r) i
strokeDashArray = attr (AttrName "stroke-dasharray") <<< isDashArray