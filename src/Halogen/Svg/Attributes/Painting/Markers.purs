module Halogen.Svg.Attributes.Painting.Markers where

import Prelude

import Halogen.HTML (AttrName(..), IProp, attr)
import Halogen.Svg.Attributes.ContentType (class IsLengthPercentageNumber, Angle, isLengthPercentageNumber, URL(..))

data MarkerUnit
  = UserSpaceOnUse
  | StrokeWidth

instance Show MarkerUnit where
  show = case _ of
    UserSpaceOnUse -> "userSpaceOnUse"
    StrokeWidth -> "strokeWidth"

data Orient
  = AutoOrient
  | AutoStartReverse

instance Show Orient where
  show = case _ of
    AutoOrient -> "auto"
    AutoStartReverse -> "auto-start-reverse"

class IsOrient a where
  isOrient :: a -> String

instance IsOrient Orient where
  isOrient = show

instance IsOrient Angle where
  isOrient = show

instance IsOrient Number where
  isOrient = show


data ColorInterpolation
  = SRGBAuto
  | SRGBLinear
  | SRGBNonLinear

instance Show ColorInterpolation where
  show = case _ of
    SRGBAuto -> "sRGB"
    SRGBLinear -> "linearRGB"
    SRGBNonLinear -> "sRGBNonLinear"

data ShapeRendering
  = ShapeRenderingAuto
  | ShapeRenderingOptimizeSpeed
  | ShapeRenderingOptimizeQuality
  | ShapeRenderingCrispEdges
  | ShapeRenderingGeometricPrecision

instance Show ShapeRendering where
  show = case _ of
    ShapeRenderingAuto -> "auto"
    ShapeRenderingOptimizeSpeed -> "optimizeSpeed"
    ShapeRenderingOptimizeQuality -> "optimizeQuality"
    ShapeRenderingCrispEdges -> "crispEdges"
    ShapeRenderingGeometricPrecision -> "geometricPrecision"


data TextRendering
  = TextRenderingAuto
  | TextRenderingOptimizeSpeed
  | TextRenderingOptimizeLegibility
  | TextRenderingGeometricPrecision

instance Show TextRendering where
  show = case _ of
    TextRenderingAuto -> "auto"
    TextRenderingOptimizeSpeed -> "optimizeSpeed"
    TextRenderingOptimizeLegibility -> "optimizeLegibility"
    TextRenderingGeometricPrecision -> "geometricPrecision"


data ImageRendering
  = ImageRenderingAuto
  | ImageRenderingOptimizeQuality
  | ImageRenderingOptimizeSpeed

instance Show ImageRendering where
  show = case _ of
    ImageRenderingAuto -> "auto"
    ImageRenderingOptimizeQuality -> "optimizeQuality"
    ImageRenderingOptimizeSpeed -> "optimizeSpeed"

markerUnits :: forall r i. MarkerUnit -> IProp (markerUnits :: String | r) i
markerUnits = attr (AttrName "markerUnits") <<< show

markerWidth :: forall a r i. IsLengthPercentageNumber a => a -> IProp (markerWidth :: String | r) i
markerWidth = attr (AttrName "markerWidth") <<< isLengthPercentageNumber

markerHeight :: forall a r i. IsLengthPercentageNumber a => a -> IProp (markerHeight :: String | r) i
markerHeight = attr (AttrName "markerHeight") <<< isLengthPercentageNumber

refX :: forall a r i. IsLengthPercentageNumber a => a -> IProp (refX :: String | r) i
refX = attr (AttrName "refX") <<< isLengthPercentageNumber

refY :: forall a r i. IsLengthPercentageNumber a => a -> IProp (refY :: String | r) i
refY = attr (AttrName "refY") <<< isLengthPercentageNumber

orient :: forall r i. Orient -> IProp (orient :: String | r) i
orient = attr (AttrName "orient") <<< show

markerStart :: forall r i. URL -> IProp (markerStart :: String | r) i
markerStart = attr (AttrName "marker-start") <<< show

markerMid :: forall r i. URL -> IProp (markerMid :: String | r) i
markerMid = attr (AttrName "marker-mid") <<< show

markerEnd :: forall r i. URL -> IProp (markerEnd :: String | r) i
markerEnd = attr (AttrName "marker-end") <<< show

-- TODO: paintOrder

colorInterpolation :: forall r i. ColorInterpolation -> IProp (colorInterpolation :: String | r) i
colorInterpolation = attr (AttrName "color-interpolation") <<< show

shapeRendering :: forall r i. ShapeRendering -> IProp (shapeRendering :: String | r) i
shapeRendering = attr (AttrName "shape-rendering") <<< show

textRendering :: forall r i. TextRendering -> IProp (textRendering :: String | r) i
textRendering = attr (AttrName "text-rendering") <<< show

imageRendering :: forall r i. ImageRendering -> IProp (imageRendering :: String | r) i
imageRendering = attr (AttrName "image-rendering") <<< show





