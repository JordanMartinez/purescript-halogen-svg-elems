module Halogen.Svg.Attributes.Geometry where

import Prelude

import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.ContentType (class IsLengthPercentage, class IsLengthPercentageNumber, class ToLength, isLengthPercentage, isLengthPercentageNumber, toLength)
import Web.HTML.Common (AttrName(..))

class IsGeometry a where  
  isGeometry :: a -> String

instance IsLengthPercentageNumber a => IsGeometry a where
  isGeometry = isLengthPercentageNumber
else instance (IsGeometry a, IsGeometry b) => IsGeometry (Tuple a b) where
  isGeometry (Tuple a b) = isGeometry a <> " " <> isGeometry b
else instance IsGeometry a => IsGeometry (Array a) where
  isGeometry = joinWith " " <<< map isGeometry


cx :: forall a r i. IsGeometry a => a -> IProp (cx :: String | r) i
cx = attr (AttrName "cx") <<< isGeometry

cy :: forall a r i. IsGeometry a => a -> IProp (cy :: String | r) i
cy = attr (AttrName "cy") <<< isGeometry

dx :: forall a r i. IsGeometry a => a -> IProp (dx :: String | r) i
dx = attr (AttrName "dx") <<< isGeometry

dy :: forall a r i. IsGeometry a => a -> IProp (dy :: String | r) i
dy = attr (AttrName "dy") <<< isGeometry

fx :: forall a r i. ToLength a => a -> IProp (fx :: String | r) i
fx = attr (AttrName "fx") <<< show <<< toLength

fy :: forall a r i. ToLength a => a -> IProp (fy :: String | r) i
fy = attr (AttrName "fy") <<< show <<< toLength

r :: forall a r i. IsGeometry a => a -> IProp (r :: String | r) i
r = attr (AttrName "r") <<< isGeometry

rx :: forall a r i. IsGeometry a => a -> IProp (rx :: String | r) i
rx = attr (AttrName "rx") <<< isGeometry

ry :: forall a r i. IsGeometry a => a -> IProp (ry :: String | r) i
ry = attr (AttrName "ry") <<< isGeometry

x :: forall a r i. IsGeometry a => a -> IProp (x :: String | r) i
x = attr (AttrName "x") <<< isGeometry

x1 :: forall a r i. IsGeometry a => a -> IProp (x1 :: String | r) i
x1 = attr (AttrName "x1") <<< isGeometry

x2 :: forall a r i. IsGeometry a => a -> IProp (x2 :: String | r) i
x2 = attr (AttrName "x2") <<< isGeometry

y :: forall a r i. IsGeometry a => a -> IProp (y :: String | r) i
y = attr (AttrName "y") <<< isGeometry

y1 :: forall a r i. IsGeometry a => a -> IProp (y1 :: String | r) i
y1 = attr (AttrName "y1") <<< isGeometry

y2 :: forall a r i. IsGeometry a => a -> IProp (y2 :: String | r) i
y2 = attr (AttrName "y2") <<< isGeometry

width :: forall a r i. IsLengthPercentageNumber a => a -> IProp (width :: String | r) i
width = attr (AttrName "width") <<< isLengthPercentageNumber

height :: forall a r i. IsLengthPercentageNumber a => a -> IProp (height :: String | r) i
height = attr (AttrName "height") <<< isLengthPercentageNumber