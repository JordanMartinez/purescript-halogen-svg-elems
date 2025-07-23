module Halogen.Svg.Attributes.Filter where

import Prelude

import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.ContentType (class IsNumberOptionalNumber, isNumberOptionalNumber)
import Web.HTML.Common (AttrName(..))

data FilterInput
  = SourceGraphic 
  | SourceAlpha 
  | BackgroundImage 
  | BackgroundAlpha 
  | FillPaint 
  | StrokePaint 
  | FilterPrimitiveReference String

data FilterUnits = UserSpaceOnUse | ObjectBoundingBox

instance Show FilterUnits where
  show = case _ of
    UserSpaceOnUse -> "userSpaceOnUse"
    ObjectBoundingBox -> "objectBoundingBox"

type PrimitiveUnits = FilterUnits 

data ColorMatrixType
  = Matrix 
  | Saturate 
  | HueRotate 
  | LuminanceToAlpha

data FunctionType
  = Identity 
  | Table 
  | Discrete 
  | Linear 
  | Gamma

data CompositeOperator
  = Over 
  | In 
  | Out 
  | Atop 
  | Xor 
  | Lighter 
  | Arithmetic

data MorphologyOperator = Erode | Dilate

data EdgeMode = Duplicate | Wrap | None

data RGBAChannel = R | G | B | A

data TurbulenceType = FractalNoise | Turbulence


printEdgeMode :: EdgeMode -> String
printEdgeMode = case _ of
  Duplicate -> "duplicate"
  Wrap -> "wrap"
  None -> "none"

printFilterInput :: FilterInput -> String
printFilterInput = case _ of
  SourceGraphic -> "SourceGraphic"
  SourceAlpha -> "SourceAlpha"
  BackgroundImage -> "BackgroundImage"
  BackgroundAlpha -> "BackgroundAlpha"
  FillPaint -> "FillPaint"
  StrokePaint -> "StrokePaint"
  (FilterPrimitiveReference s) -> s

printCompositeOperator :: CompositeOperator -> String
printCompositeOperator = case _ of
  Over -> "over"
  In -> "in"
  Out -> "out"
  Atop -> "atop"
  Xor -> "xor"
  Lighter -> "lighter"
  Arithmetic -> "arithmetic"

printRGBAChannel :: RGBAChannel -> String
printRGBAChannel = case _ of
  R -> "R"
  G -> "G"
  B -> "B"
  A -> "A"

-- Attributes
in_ :: forall r i. FilterInput -> IProp ("in" :: String | r) i
in_ = attr (AttrName "in") <<< printFilterInput

in2 :: forall r i. FilterInput -> IProp ("in2" :: String | r) i
in2 = attr (AttrName "in2") <<< printFilterInput

scale :: forall r i. Number -> IProp (scale :: String | r) i
scale = attr (AttrName "scale") <<< show

filterUnits :: forall r i. FilterUnits -> IProp (filterUnits :: String | r) i
filterUnits = attr (AttrName "filterUnits") <<< show

primitiveUnits :: forall r i. PrimitiveUnits -> IProp (primitiveUnits :: String | r) i
primitiveUnits = attr (AttrName "primitiveUnits") <<< show

sdtDeviation :: forall a r i. IsNumberOptionalNumber a => a -> IProp (stdDeviation :: String | r) i
sdtDeviation = attr (AttrName "stdDeviation") <<< isNumberOptionalNumber

edgeMode :: forall r i. EdgeMode -> IProp (edgeMode :: String | r) i
edgeMode = attr (AttrName "edgeMode") <<< printEdgeMode

operator :: forall r i. CompositeOperator -> IProp (operator :: String | r) i
operator = attr (AttrName "operator") <<< printCompositeOperator

radius :: forall a r i. IsNumberOptionalNumber a => a -> IProp (radius :: String | r) i
radius = attr (AttrName "radius") <<< isNumberOptionalNumber

xChannelSelector :: forall r i. RGBAChannel -> IProp (xChannelSelector :: String | r) i
xChannelSelector = attr (AttrName "xChannelSelector") <<< printRGBAChannel

yChannelSelector :: forall r i. RGBAChannel -> IProp (yChannelSelector :: String | r) i
yChannelSelector = attr (AttrName "yChannelSelector") <<< printRGBAChannel

azimuth :: forall r i. Number -> IProp (azimuth :: String | r) i
azimuth = attr (AttrName "azimuth") <<< show

elevation :: forall r i. Number -> IProp (elevation :: String | r) i
elevation = attr (AttrName "elevation") <<< show

result :: forall r i. String -> IProp (result :: String | r) i
result = attr (AttrName "result")







