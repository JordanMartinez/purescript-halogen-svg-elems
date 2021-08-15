-- | Each attribute has two functions: `show` from the type class `Show` and
-- | `printX` where X corresponds to the type. When printing the value for SVG
-- | attributes, use the `printX` function. For example:
-- |
-- |   `fill = attr (H.AttrName "fill") <<< printColor`
-- |
-- | When debugging, use either `show` or `printX`.
module Halogen.Svg.Attributes
  ( module Halogen.Svg.Attributes.Align
  , module Halogen.Svg.Attributes.Baseline
  , module Halogen.Svg.Attributes.Color
  , module Halogen.Svg.Attributes.CSSLength
  , module Halogen.Svg.Attributes.Duration
  , module Halogen.Svg.Attributes.FillState
  , module Halogen.Svg.Attributes.FontSize
  , module Halogen.Svg.Attributes.MarkerUnit
  , module Halogen.Svg.Attributes.MeetOrSlice
  , module Halogen.Svg.Attributes.Orient
  , module Halogen.Svg.Attributes.Path
  , module Halogen.Svg.Attributes.TextAnchor
  , module Halogen.Svg.Attributes.Transform
  , attr
  , attributeName
  , begin
  , class_
  , classes
  , cx, cy
  , d
  , dominant_baseline
  , dur
  , fill
  , fillAnim
  , fillOpacity
  , font_family
  , font_size
  , font_size_adjust
  , font_stretch
  , font_style
  , font_variant
  , font_weight
  , from, to
  , href
  , id
  , markerStart, markerMid, markerEnd
  , markerUnits
  , markerWidth, markerHeight
  , orient
  , path
  , preserveAspectRatio
  , r
  , refX, refY
  , repeatCount
  , rx, ry
  , seconds
  , stroke
  , stroke_dasharray
  , stroke_dashoffset
  , stroke_linecap
  , stroke_linejoin
  , stroke_miterlimit
  , stroke_opacity
  , strokeWidth
  , text_anchor
  , transform
  , viewBox
  , width, height
  , x, y
  , x1, y1
  , x2, y2
  , xlinkHref
  ) where
-- Like Halogen.HTML.Properties

import Prelude
import Data.Maybe (Maybe(..))
import Data.Newtype (un)
import Data.String (joinWith)
import Halogen.HTML.Core as H
import Halogen.HTML.Properties (IProp, attrNS)
import Halogen.Svg.Attributes.Align (Align(..), printAlign)
import Halogen.Svg.Attributes.Baseline (Baseline(..), printBaseline)
import Halogen.Svg.Attributes.Color (Color(..), printColor)
import Halogen.Svg.Attributes.CSSLength (CSSLength(..), printCSSLength)
import Halogen.Svg.Attributes.Duration ( Duration, printDuration
                                       , DurationF(..), printDurationF )
import Halogen.Svg.Attributes.FillState (FillState(..), printFillState)
import Halogen.Svg.Attributes.FontSize (FontSize(..), printFontSize)
import Halogen.Svg.Attributes.MarkerUnit (MarkerUnit(..), printMarkerUnit)
import Halogen.Svg.Attributes.MeetOrSlice (MeetOrSlice(..), printMeetOrSlice)
import Halogen.Svg.Attributes.Orient (Orient(..), printOrient)
import Halogen.Svg.Attributes.TextAnchor (TextAnchor(..), printTextAnchor)
import Halogen.Svg.Attributes.Transform (Transform(..), printTransform)
import Halogen.Svg.Core as Core
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Halogen.Svg.Attributes.Path (
  PathCommand,
  CommandPositionReference(..),
  CommandArcChoice(..),
  CommandSweepChoice(..),
  toArrayString,
  m, l, h, v, c, s, q, t, a, z
  )

attr :: forall r i. H.AttrName -> String -> IProp r i
attr = coe Core.attr
  where
    coe :: (H.AttrName -> String -> H.Prop i) -> H.AttrName -> String -> IProp r i
    coe = unsafeCoerce

-- TODO ADT or free string?
attributeName :: forall r i. String -> IProp (attributeName :: String | r) i
attributeName = attr (H.AttrName "attributeName")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
begin :: forall r i. String -> IProp (begin :: String | r) i
begin = attr (H.AttrName "begin")

class_ :: forall r i . H.ClassName -> IProp (class :: String | r) i
class_ = attr (H.AttrName "class") <<< un H.ClassName

classes :: forall r i . Array H.ClassName -> IProp (class :: String | r) i
classes = attr (H.AttrName "class") <<< joinWith " " <<< coerce

cx :: forall r i. Number -> IProp (cx :: Number | r) i
cx = attr (H.AttrName "cx") <<< show

cy :: forall r i. Number -> IProp (cy :: Number | r) i
cy = attr (H.AttrName "cy") <<< show

d :: forall r i . Array PathCommand -> IProp (d :: String | r) i
d = attr (H.AttrName "d") <<< joinWith " " <<< toArrayString

dominant_baseline :: forall r i . Baseline -> IProp (transform :: String | r) i
dominant_baseline = attr (H.AttrName "dominant-baseline") <<< printBaseline

dur :: forall r i. Duration -> IProp (dur :: String | r) i
dur = attr (H.AttrName "dur") <<< printDuration

fill :: forall r i. Maybe Color -> IProp (fill :: String | r) i
fill = attr (H.AttrName "fill") <<< printColor

{- TODO this is just 'fill', but that function is already specialised to Color
   in this module -}
fillAnim :: forall r i. FillState -> IProp (fill :: String | r) i
fillAnim = attr (H.AttrName "fill") <<< printFillState

fillOpacity :: forall r i. Number -> IProp (fillOpacity :: Number | r) i
fillOpacity = attr (H.AttrName "fill-opacity") <<< show

font_family :: forall r i. String -> IProp (font_family :: String | r) i
font_family = attr (H.AttrName "font-family")

font_size :: forall r i. FontSize -> IProp (font_size :: String | r) i
font_size = attr (H.AttrName "font-size") <<< printFontSize

font_size_adjust :: forall r i. Number -> IProp (font_size_adjust :: String | r) i
font_size_adjust = attr (H.AttrName "font-size-adjust") <<< show

font_stretch :: forall r i. String -> IProp (font_stretch :: String | r) i
font_stretch = attr (H.AttrName "font-stretch")

font_style :: forall r i. String -> IProp (font_style :: String | r) i
font_style = attr (H.AttrName "font-style")

font_variant :: forall r i. String -> IProp (font_variant :: String | r) i
font_variant = attr (H.AttrName "font-variant")

font_weight :: forall r i. String -> IProp (font_weight :: String | r) i
font_weight = attr (H.AttrName "font-weight")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
from :: forall r i. String -> IProp (from :: String | r) i
from = attr (H.AttrName "from")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to
to :: forall r i. String -> IProp (to :: String | r) i
to = attr (H.AttrName "to")

id :: forall r i . String -> IProp (id :: String | r) i
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

orient :: forall r i. Orient -> IProp (orient :: String | r) i
orient = attr (H.AttrName "orient") <<< printOrient

-- TODO copied from `d`; adapt where needed
path :: forall r i . Array PathCommand -> IProp (path :: String | r) i
path = attr (H.AttrName "path") <<< joinWith " " <<< toArrayString

preserveAspectRatio :: forall r i. Maybe {x_ :: Align, y_ :: Align} ->
  MeetOrSlice -> IProp (preserveAspectRatio :: String | r) i
preserveAspectRatio align slice = attr
  (H.AttrName "preserveAspectRatio")
  (joinWith " " $ [align_str, printMeetOrSlice slice])
  where
    align_str = case align of
      Nothing -> "none"
      Just {x_, y_} -> joinWith "" $ ["x", printAlign x_, "Y", printAlign y_]

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

-- TODO add other constructors
seconds :: Number -> Duration
seconds s_ = Duration Nothing Nothing (Just s_) Nothing

stroke :: forall r i. Maybe Color -> IProp (stroke :: String | r) i
stroke = attr (H.AttrName "stroke") <<< printColor

stroke_dasharray :: forall r i. String -> IProp (strokeDasharray :: String | r) i
stroke_dasharray = attr (H.AttrName "stroke-dasharray")

stroke_dashoffset :: forall r i. Number -> IProp (strokeDashoffset :: String | r) i
stroke_dashoffset = attr (H.AttrName "stroke-dashoffset") <<< show

stroke_linecap :: forall r i. String -> IProp (strokeLinecap :: String | r) i
stroke_linecap = attr (H.AttrName "stroke-linecap")

stroke_linejoin :: forall r i. String -> IProp (strokeLinejoin :: String | r) i
stroke_linejoin = attr (H.AttrName "stroke-linejoin")

stroke_miterlimit :: forall r i. String -> IProp (strokeMiterlimit :: String | r) i
stroke_miterlimit = attr (H.AttrName "stroke-miterlimit")

stroke_opacity :: forall r i. Number -> IProp (strokeOpacity :: String | r) i
stroke_opacity = attr (H.AttrName "stroke-opacity") <<< show

strokeWidth :: forall r i. Number -> IProp (strokeWidth :: Number | r) i
strokeWidth = attr (H.AttrName "stroke-width") <<< show

text_anchor :: forall r i . TextAnchor -> IProp (text_anchor :: String | r) i
text_anchor = attr (H.AttrName "text-anchor") <<< printTextAnchor

transform :: forall r i . Array Transform -> IProp (transform :: String | r) i
transform = attr (H.AttrName "transform") <<< joinWith " " <<< map printTransform

viewBox :: forall r i.
  Number -> Number -> Number -> Number -> IProp (viewBox :: String | r) i
viewBox x_ y_ w h_ =
  attr (H.AttrName "viewBox") (joinWith " " $ map show [x_, y_, w, h_])

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

href :: forall r i. String -> IProp ( href :: String | r ) i
href = attr (H.AttrName "href")

-- TODO xlink:href seems to have some issues, among others around its namespace
xlinkHref :: forall r i. String -> IProp (xlinkHref :: String | r) i
-- xlinkHref = attr (H.AttrName "xlink:href")
-- xlinkHref = attrNS (H.Namespace "xlink") (H.AttrName "href")
xlinkHref = attrNS (H.Namespace "xlink") (H.AttrName "xlink:href")
