
-- | Similar to `Halogen.HTML.Properties`. You should always use
-- | this module's entities (e.g. `class_`) over its corresponding
-- | value in `Halogen.HTML.Properties (e.g. `HP.class_`).
-- |
-- | When Algebraic Data Types (ADTs) are used, use the
-- | `show` function to display what the ADT is and the `printX` function
-- | to render the corresponding String value that should appear in the HTML.
module Halogen.Svg.Attributes
  ( module Halogen.Svg.Attributes.Align
  , module Halogen.Svg.Attributes.Baseline
  , module Halogen.Svg.Attributes.Color
  , module Halogen.Svg.Attributes.CSSLength
  , module Halogen.Svg.Attributes.Duration
  , module Halogen.Svg.Attributes.FillState
  , module Halogen.Svg.Attributes.FontSize
  , module Halogen.Svg.Attributes.FontStyle
  , module Halogen.Svg.Attributes.FontStretch
  , module Halogen.Svg.Attributes.FontWeight
  , module Halogen.Svg.Attributes.MarkerUnit
  , module Halogen.Svg.Attributes.MaskUnit
  , module Halogen.Svg.Attributes.MeetOrSlice
  , module Halogen.Svg.Attributes.Orient
  , module Halogen.Svg.Attributes.Path
  , module Halogen.Svg.Attributes.StrokeLineCap
  , module Halogen.Svg.Attributes.StrokeLineJoin
  , module Halogen.Svg.Attributes.TextAnchor
  , module Halogen.Svg.Attributes.Transform
  , attributeName
  , begin
  , class_
  , classes
  , cx
  , cy
  , d
  , dominantBaseline
  , dur
  , fill
  , fillAnim
  , fillOpacity
  , fontFamily
  , fontSize
  , fontSizeAdjust
  , fontStretch
  , fontStyle
  , fontVariant
  , fontWeight
  , from
  , to
  , href
  , id
  , markerStart
  , markerMid
  , markerEnd
  , markerUnits
  , markerWidth
  , markerHeight
  , mask
  , maskUnits
  , maskContentUnits
  , orient
  , path
  , points
  , pathLength
  , preserveAspectRatio
  , r
  , refX
  , refY
  , repeatCount
  , rx
  , ry
  , stroke
  , strokeDashArray
  , strokeDashOffset
  , strokeLineCap
  , strokeLineJoin
  , strokeMiterLimit
  , strokeOpacity
  , strokeWidth
  , textAnchor
  , transform
  , viewBox
  , width
  , height
  , x
  , y
  , x1
  , y1
  , x2
  , y2
  , xlinkHref
  ) where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (un)
import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Halogen.HTML.Core as H
import Halogen.HTML.Properties (IProp, attr, attrNS)
import Halogen.Svg.Attributes.Align (Align(..), printAlign)
import Halogen.Svg.Attributes.Baseline (Baseline(..), printBaseline)
import Halogen.Svg.Attributes.CSSLength (CSSLength(..), printCSSLength)
import Halogen.Svg.Attributes.Color (Color(..), printColor)
import Halogen.Svg.Attributes.Duration (Duration)
import Halogen.Svg.Attributes.FillState (FillState(..), printFillState)
import Halogen.Svg.Attributes.FontSize (FontSize(..), printFontSize)
import Halogen.Svg.Attributes.FontStretch (FontStretch, printFontStretch)
import Halogen.Svg.Attributes.FontStyle (FontStyle, printFontStyle)
import Halogen.Svg.Attributes.FontWeight (FontWeight, printFontWeight)
import Halogen.Svg.Attributes.MarkerUnit (MarkerUnit(..), printMarkerUnit)
import Halogen.Svg.Attributes.MaskUnit (MaskUnit(..), printMaskUnit)
import Halogen.Svg.Attributes.MeetOrSlice (MeetOrSlice(..), printMeetOrSlice)
import Halogen.Svg.Attributes.Orient (Orient(..), printOrient)
import Halogen.Svg.Attributes.Path (PathCommand, CommandPositionReference(..), CommandArcChoice(..), CommandSweepChoice(..), toArrayString, m, l, h, v, c, s, q, t, a, z)
import Halogen.Svg.Attributes.StrokeLineCap (StrokeLineCap, printStrokeLineCap)
import Halogen.Svg.Attributes.StrokeLineJoin (StrokeLineJoin, printStrokeLineJoin)
import Halogen.Svg.Attributes.TextAnchor (TextAnchor(..), printTextAnchor)
import Halogen.Svg.Attributes.Transform (Transform(..), printTransform)
import Safe.Coerce (coerce)

attributeName :: forall r i. String -> IProp (attributeName :: String | r) i
attributeName = attr (H.AttrName "attributeName")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
begin :: forall r i. String -> IProp (begin :: String | r) i
begin = attr (H.AttrName "begin")

class_ :: forall r i. H.ClassName -> IProp (class :: String | r) i
class_ = attr (H.AttrName "class") <<< un H.ClassName

classes :: forall r i. Array H.ClassName -> IProp (class :: String | r) i
classes = attr (H.AttrName "class") <<< joinWith " " <<< coerce

cx :: forall r i. Number -> IProp (cx :: Number | r) i
cx = attr (H.AttrName "cx") <<< show

cy :: forall r i. Number -> IProp (cy :: Number | r) i
cy = attr (H.AttrName "cy") <<< show

d :: forall r i. Array PathCommand -> IProp (d :: String | r) i
d = attr (H.AttrName "d") <<< joinWith " " <<< toArrayString

dominantBaseline :: forall r i. Baseline -> IProp (dominantBaseline :: String | r) i
dominantBaseline = attr (H.AttrName "dominant-baseline") <<< printBaseline

dur :: forall r i. Duration -> IProp (dur :: String | r) i
dur = attr (H.AttrName "dur") <<< printDuration
  where
  printDuration :: Duration -> String
  printDuration { hours, minutes, seconds, milliseconds } =
    f "h" hours <> f "m" minutes <> f "s" seconds <> f "i" milliseconds

  f unit_ = maybe "" (\val -> show val <> unit_)

fill :: forall r i. Color -> IProp (fill :: String | r) i
fill = attr (H.AttrName "fill") <<< printColor

-- Note: same as 'fill' but that function is already specialised to Color
fillAnim :: forall r i. FillState -> IProp (fill :: String | r) i
fillAnim = attr (H.AttrName "fill") <<< printFillState

fillOpacity :: forall r i. Number -> IProp (fillOpacity :: Number | r) i
fillOpacity = attr (H.AttrName "fill-opacity") <<< show

fontFamily :: forall r i. String -> IProp (fontFamily :: String | r) i
fontFamily = attr (H.AttrName "font-family")

fontSize :: forall r i. FontSize -> IProp (fontSize :: String | r) i
fontSize = attr (H.AttrName "font-size") <<< printFontSize

fontSizeAdjust :: forall r i. Number -> IProp (fontSizeAdjust :: String | r) i
fontSizeAdjust = attr (H.AttrName "font-size-adjust") <<< show

fontStretch :: forall r i. FontStretch -> IProp (fontStretch :: String | r) i
fontStretch = attr (H.AttrName "font-stretch") <<< printFontStretch

fontStyle :: forall r i. FontStyle -> IProp (fontStyle :: String | r) i
fontStyle = attr (H.AttrName "font-style") <<< printFontStyle

fontVariant :: forall r i. String -> IProp (fontVariant :: String | r) i
fontVariant = attr (H.AttrName "font-variant")

fontWeight :: forall r i. FontWeight -> IProp (fontWeight :: String | r) i
fontWeight = attr (H.AttrName "font-weight") <<< printFontWeight

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
from :: forall r i. String -> IProp (from :: String | r) i
from = attr (H.AttrName "from")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to
to :: forall r i. String -> IProp (to :: String | r) i
to = attr (H.AttrName "to")

id :: forall r i. String -> IProp (id :: String | r) i
id = attr (H.AttrName "id")

markerStart :: forall r i. String -> IProp (markerStart :: String | r) i
markerStart = attr (H.AttrName "marker-start")

markerMid :: forall r i. String -> IProp (markerMid :: String | r) i
markerMid = attr (H.AttrName "marker-mid")

markerEnd :: forall r i. String -> IProp (markerEnd :: String | r) i
markerEnd = attr (H.AttrName "marker-end")

markerUnits :: forall r i. MarkerUnit -> IProp (markerUnits :: String | r) i
markerUnits = attr (H.AttrName "markerUnits") <<< printMarkerUnit

markerWidth :: forall r i. Number -> IProp (markerWidth :: Number | r) i
markerWidth = attr (H.AttrName "markerWidth") <<< show

markerHeight :: forall r i. Number -> IProp (markerHeight :: Number | r) i
markerHeight = attr (H.AttrName "markerHeight") <<< show

mask :: forall s i. String -> IProp (mask :: String | s) i
mask = attr (H.AttrName "mask")

maskUnits :: forall r i. MaskUnit -> IProp (maskUnits :: String | r) i
maskUnits = attr (H.AttrName "maskUnits") <<< printMaskUnit

maskContentUnits :: forall r i. MaskUnit -> IProp (maskContentUnits :: String | r) i
maskContentUnits = attr (H.AttrName "maskContentUnits") <<< printMaskUnit

orient :: forall r i. Orient -> IProp (orient :: String | r) i
orient = attr (H.AttrName "orient") <<< printOrient

path :: forall r i. Array PathCommand -> IProp (path :: String | r) i
path = attr (H.AttrName "path") <<< joinWith " " <<< toArrayString

-- | An array of x-y value pairs (e.g. `[ Tuple x y ]`).
points :: forall r i. Array (Tuple Number Number) -> IProp (points :: String | r) i
points = attr (H.AttrName "points") <<< Array.intercalate " " <<< map (\(Tuple x_ y_) -> show x_ <> "," <> show y_)

pathLength :: forall r i. Number -> IProp (pathLength :: Number | r) i
pathLength = attr (H.AttrName "pathLength") <<< show

preserveAspectRatio
  :: forall r i
   . Maybe { x_ :: Align, y_ :: Align }
  -> MeetOrSlice
  -> IProp (preserveAspectRatio :: String | r) i
preserveAspectRatio align slice = attr
  (H.AttrName "preserveAspectRatio")
  (joinWith " " $ [ align_str, printMeetOrSlice slice ])
  where
  align_str = case align of
    Nothing -> "none"
    Just { x_, y_ } -> joinWith "" $ [ "x", printAlign x_, "Y", printAlign y_ ]

r :: forall s i. Number -> IProp (r :: Number | s) i
r = attr (H.AttrName "r") <<< show

refX :: forall r i. Number -> IProp (refX :: Number | r) i
refX = attr (H.AttrName "refX") <<< show

refY :: forall r i. Number -> IProp (refY :: Number | r) i
refY = attr (H.AttrName "refY") <<< show

repeatCount :: forall r i. Int -> IProp (repeatCount :: Int | r) i
repeatCount = attr (H.AttrName "repeatCount") <<< show

rx :: forall r i. Number -> IProp (rx :: Number | r) i
rx = attr (H.AttrName "rx") <<< show

ry :: forall r i. Number -> IProp (ry :: Number | r) i
ry = attr (H.AttrName "ry") <<< show

stroke :: forall r i. Color -> IProp (stroke :: String | r) i
stroke = attr (H.AttrName "stroke") <<< printColor

strokeDashArray :: forall r i. String -> IProp (strokeDashArray :: String | r) i
strokeDashArray = attr (H.AttrName "stroke-dasharray")

strokeDashOffset :: forall r i. Number -> IProp (strokeDashOffset :: String | r) i
strokeDashOffset = attr (H.AttrName "stroke-dashoffset") <<< show

strokeLineCap :: forall r i. StrokeLineCap -> IProp (strokeLineCap :: String | r) i
strokeLineCap = attr (H.AttrName "stroke-linecap") <<< printStrokeLineCap

strokeLineJoin :: forall r i. StrokeLineJoin -> IProp (strokeLineJoin :: String | r) i
strokeLineJoin = attr (H.AttrName "stroke-linejoin") <<< printStrokeLineJoin

-- | The `Number` arg must be greater than or equal to 1. Thus, this function
-- | will use `1.0` if given any value less than `1.0`.
strokeMiterLimit :: forall r i. Number -> IProp (strokeMiterLimit :: String | r) i
strokeMiterLimit = attr (H.AttrName "stroke-miterlimit") <<< show <<< max 1.0

strokeOpacity :: forall r i. Number -> IProp (strokeOpacity :: String | r) i
strokeOpacity = attr (H.AttrName "stroke-opacity") <<< show

strokeWidth :: forall r i. Number -> IProp (strokeWidth :: Number | r) i
strokeWidth = attr (H.AttrName "stroke-width") <<< show

textAnchor :: forall r i. TextAnchor -> IProp (textAnchor :: String | r) i
textAnchor = attr (H.AttrName "text-anchor") <<< printTextAnchor

transform :: forall r i. Array Transform -> IProp (transform :: String | r) i
transform = attr (H.AttrName "transform") <<< joinWith " " <<< map printTransform

viewBox
  :: forall r i
   . Number
  -> Number
  -> Number
  -> Number
  -> IProp (viewBox :: String | r) i
viewBox x_ y_ w h_ =
  attr (H.AttrName "viewBox") (joinWith " " $ map show [ x_, y_, w, h_ ])

width :: forall r i. Number -> IProp (width :: Number | r) i
width = attr (H.AttrName "width") <<< show

height :: forall r i. Number -> IProp (height :: Number | r) i
height = attr (H.AttrName "height") <<< show

x :: forall r i. Number -> IProp (x :: Number | r) i
x = attr (H.AttrName "x") <<< show

y :: forall r i. Number -> IProp (y :: Number | r) i
y = attr (H.AttrName "y") <<< show

x1 :: forall r i. Number -> IProp (x1 :: Number | r) i
x1 = attr (H.AttrName "x1") <<< show

y1 :: forall r i. Number -> IProp (y1 :: Number | r) i
y1 = attr (H.AttrName "y1") <<< show

x2 :: forall r i. Number -> IProp (x2 :: Number | r) i
x2 = attr (H.AttrName "x2") <<< show

y2 :: forall r i. Number -> IProp (y2 :: Number | r) i
y2 = attr (H.AttrName "y2") <<< show

href :: forall r i. String -> IProp (href :: String | r) i
href = attr (H.AttrName "href")

-- TODO xlink:href seems to have some issues, among others around its namespace
xlinkHref :: forall r i. String -> IProp (xlinkHref :: String | r) i
-- xlinkHref = attr (H.AttrName "xlink:href")
-- xlinkHref = attrNS (H.Namespace "xlink") (H.AttrName "href")
xlinkHref = attrNS (H.Namespace "xlink") (H.AttrName "xlink:href")
