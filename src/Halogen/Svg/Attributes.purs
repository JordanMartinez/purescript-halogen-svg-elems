module Halogen.Svg.Attributes
  ( Color(..)
  , printColor
  , Transform(..)
  , TextAnchor(..)
  , CSSLength(..)
  , FontSize(..)
  , Orient(..)
  , printOrient
  , MarkerUnit(..)
  , printMarkerUnit
  , printTextAnchor
  , Baseline(..)
  , printBaseline
  , printTransform
  , PathCommand -- constructor not exported
  , printPathCommand
  , CommandPositionReference(..)
  , CommandArcChoice(..)
  , printCommandArcChoice
  , CommandSweepChoice(..)
  , printCommandSweepChoice
  , m, l, h, v, c, s, q, t, a, z
  , Align(..)
  , printAlign
  , MeetOrSlice(..)
  , printMeetOrSlice
  , attr
  , cx, cy
  , r
  , viewBox
  , preserveAspectRatio
  , rx, ry
  , width, height
  , x, y
  , x1, y1
  , x2, y2
  , stroke
  , fill
  , transform
  , d
  , text_anchor
  , font_size
  , dominant_baseline
  , class_
  , classes
  , id
  , markerWidth, markerHeight
  , refX, refY
  , orient
  , markerUnits
  , strokeWidth
  , markerEnd
  , DurationF(..)
  , printDurationF
  , Duration
  , printDuration
  , seconds
  , FillState(..)
  , printFillState
  , dur
  , attributeName
  , from, to
  , begin
  , repeatCount
  , fillAnim
  , xlinkHref
  , path
  )
  where
-- Like Halogen.HTML.Properties

import Prelude
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (un)
import Data.String (joinWith, toUpper)

import Halogen.Svg.Core as Core

import Halogen.HTML.Core (Prop, AttrName(AttrName), Namespace(Namespace), ClassName(..))
import Halogen.HTML.Properties (IProp, attrNS)
import Unsafe.Coerce (unsafeCoerce)

data Color = RGB Int Int Int
           | RGBA Int Int Int Number
           | Named String

printColor :: Maybe Color -> String
printColor = case _ of
  Just (RGB r_ g_ b_) -> "rgb(" <> (joinWith "," $ map show [r_, g_, b_]) <> ")"
  Just (RGBA r_ g_ b_ o) -> "rgba(" <> (joinWith "," $ map show [r_, g_, b_]) <> "," <> show o <> ")"
  Just (Named str) -> str
  Nothing -> "None"

data Transform
  = Matrix Number Number Number Number Number Number
  | Translate Number Number
  | Scale Number Number
  | Rotate Number Number Number
  | SkewX Number
  | SkewY Number

data TextAnchor = Start | AnchorMiddle | End

data CSSLength
  = Cm Number
  | Mm Number
  | Inches Number
  | Px Number
  | Pt Number
  | Pc Number
  | Em Number
  | Ex Number
  | Rem Number
  | Vw Number
  | Vh Number
  | Vmin Number
  | Vmax Number
  | Pct Number
  | Nil

instance showCSSLength :: Show CSSLength where
  show = case _ of
    Cm i -> (show i) <> "cm"
    Mm i -> (show i) <> "mm"
    Inches i -> (show i) <> "in"
    Px i -> (show i) <> "px"
    Pt i -> (show i) <> "pt"
    Pc i -> (show i) <> "pc"
    Em i -> (show i) <> "em"
    Ex i -> (show i) <> "ex"
    Rem i -> (show i) <> "rem"
    Vw i -> (show i) <> "vw"
    Vh i -> (show i) <> "vh"
    Vmin i -> (show i) <> "vmin"
    Vmax i -> (show i) <> "vmax"
    Pct i -> (show i) <> "%"
    Nil -> "0"

data FontSize
  = XXSmall
  | XSmall
  | Small
  | Medium
  | Large
  | XLarge
  | XXLarge
  | Smaller
  | Larger
  | FontSizeLength CSSLength

data Orient
  = AutoOrient
  | AutoStartReverse

instance showOrient :: Show Orient where
  show AutoOrient = "auto"
  show AutoStartReverse = "auto-start-reverse"

printOrient :: Orient -> String
printOrient AutoOrient = "auto"
printOrient AutoStartReverse = "auto-start-reverse"

data MarkerUnit
  = UserSpaceOnUse
  | StrokeWidth

instance showMarkerUnit :: Show MarkerUnit where
  show UserSpaceOnUse = "userSpaceOnUse"
  show StrokeWidth = "strokeWidth"

printMarkerUnit :: MarkerUnit -> String
printMarkerUnit = case _ of
  UserSpaceOnUse -> "userSpaceOnUse"
  StrokeWidth -> "strokeWidth"

instance showFontSize :: Show FontSize where
  show = case _ of
    XXSmall -> "xx-small"
    XSmall -> "x-small"
    Small -> "small"
    Medium -> "medium"
    Large -> "large"
    XLarge -> "x-large"
    XXLarge -> "xx-large"
    Smaller -> "smaller"
    Larger -> "larger"
    FontSizeLength l_ -> show l_

printTextAnchor :: TextAnchor -> String
printTextAnchor = case _ of
  Start -> "start"
  AnchorMiddle -> "middle"
  End -> "end"

data Baseline
  = Auto | UseScript | NoChange | ResetSize | Ideographic | Alphabetic | Hanging
  | Mathematical | Central | BaselineMiddle | TextAfterEdge | TextBeforeEdge

printBaseline :: Baseline -> String
printBaseline = case _ of
  Auto -> "auto"
  UseScript -> "use-script"
  NoChange -> "no-change"
  ResetSize -> "reset-size"
  Ideographic -> "ideographic"
  Alphabetic -> "alphabetic"
  Hanging -> "hanging"
  Mathematical -> "mathematical"
  Central -> "central"
  BaselineMiddle -> "middle"
  TextAfterEdge -> "text-after-edge"
  TextBeforeEdge -> "text-before-edge"

printTransform :: Transform -> String
printTransform = case _ of
  Matrix a_ b_ c_ d_ e_ f_ ->
    "matrix(" <> (joinWith "," $ map show [a_, b_, c_, d_, e_, f_]) <> ")"
  Translate x_ y_ ->
    "translate(" <> (joinWith "," $ map show [x_, y_]) <> ")"
  Scale x_ y_ ->
    "scale(" <> (joinWith "," $ map show [x_, y_]) <> ")"
  Rotate a_ x_ y_ ->
    "rotate(" <> (joinWith "," $ map show [a_, x_, y_]) <> ")"
  SkewX a_ ->
    "skewX(" <> show a_ <> ")"
  SkewY a_ ->
    "skewY(" <> show a_ <> ")"

newtype PathCommand = PathCommand String
derive instance eqPathCommand :: Eq PathCommand
instance showPathCommand :: Show PathCommand where
  show val = printPathCommand val

printPathCommand :: PathCommand -> String
printPathCommand (PathCommand s_) = s_

data CommandPositionReference = Rel | Abs
derive instance eqCommandPositionReference :: Eq CommandPositionReference
instance showCommandPositionReference :: Show CommandPositionReference where
  show = case _ of
    Abs -> "Abs"
    Rel -> "Rel"

-- | Arc0 = Small arc
-- | Arc1 = Large arc
data CommandArcChoice = Arc0 | Arc1
derive instance eqCommandArcChoice :: Eq CommandArcChoice
instance showCommandArcChoice :: Show CommandArcChoice where
  show = case _ of
    Arc0 -> "Arc0"
    Arc1 -> "Arc1"

printCommandArcChoice :: CommandArcChoice -> String
printCommandArcChoice = case _ of
  Arc0 -> "0"
  Arc1 -> "1"

-- | Sweep0 = Counter-Clockwise / Negative
-- | Sweep1 = Clockwise / Positive
data CommandSweepChoice = Sweep0 | Sweep1
derive instance eqCommandSweepChoice :: Eq CommandSweepChoice
instance showCommandSweepChoice :: Show CommandSweepChoice where
  show = case _ of
    Sweep0 -> "Sweep0"
    Sweep1 -> "Sweep1"

printCommandSweepChoice :: CommandSweepChoice -> String
printCommandSweepChoice = case _ of
  Sweep0 -> "0"
  Sweep1 -> "1"

-- For internal use. Do not export.
renderCommand :: CommandPositionReference -> String -> String
renderCommand cmd s_ = case cmd of
  Rel -> s_
  Abs -> toUpper s_

-- For internal use. Do not export.
renderCommand1Arg :: String -> CommandPositionReference -> Number -> PathCommand
renderCommand1Arg s_ ref a_ = PathCommand $ (renderCommand ref s_) <> show a_

-- For internal use. Do not export.
renderCommand2Args :: String -> CommandPositionReference -> Number -> Number -> PathCommand
renderCommand2Args s_ ref a_ b =
  PathCommand $ (renderCommand ref s_) <> show a_ <> ", " <> show b

-- For internal use. Do not export.
renderCommand4Args :: String -> CommandPositionReference -> Number -> Number -> Number -> Number -> PathCommand
renderCommand4Args s_ ref a_ b c_ d_ =
  PathCommand $ (renderCommand ref s_) <>
    show a_ <> ", " <> show b <> ", " <> show c_ <> ", " <> show d_

m :: CommandPositionReference -> Number -> Number -> PathCommand
m = renderCommand2Args "m"

l :: CommandPositionReference -> Number -> Number -> PathCommand
l = renderCommand2Args "l"

h :: CommandPositionReference -> Number -> PathCommand
h = renderCommand1Arg "h"

v :: CommandPositionReference -> Number -> PathCommand
v = renderCommand1Arg "v"

c :: CommandPositionReference -> Number -> Number -> Number -> Number -> Number -> Number -> PathCommand
c ref x1_ y1_ x2_ y2_ x_ y_ = PathCommand $ (renderCommand ref "c") <>
    show x1_ <> ", " <> show y1_ <> ", " <> show x2_ <> ", " <> show y2_ <>
    show x_ <> ", " <> show y_

s :: CommandPositionReference -> Number -> Number -> Number -> Number -> PathCommand
s = renderCommand4Args "s"

q :: CommandPositionReference -> Number -> Number -> Number -> Number -> PathCommand
q = renderCommand4Args "q"

t :: CommandPositionReference -> Number -> Number -> PathCommand
t = renderCommand2Args "t"

a :: CommandPositionReference -> Number -> Number -> Number -> CommandArcChoice -> CommandSweepChoice -> Number -> Number -> PathCommand
a ref rx_ ry_ rot arc sweep x_ y_ = PathCommand $ (renderCommand ref "a") <>
  show rx_ <> ", " <> show ry_ <> ", " <> show rot <>
  (printCommandArcChoice arc) <> " " <> (printCommandSweepChoice sweep) <>
  show x_ <> " " <> show y_

z :: PathCommand
z = PathCommand "z"

data Align = Min | Mid | Max

printAlign :: Align -> String
printAlign = case _ of
  Min -> "Min"
  Mid -> "Mid"
  Max -> "Max"

data MeetOrSlice = Meet | Slice

printMeetOrSlice :: MeetOrSlice -> String
printMeetOrSlice = case _ of
  Meet -> "meet"
  Slice -> "slice"

attr :: forall r i. AttrName -> String -> IProp r i
attr = coe Core.attr
  where
    coe :: (AttrName -> String -> Prop i) -> AttrName -> String -> IProp r i
    coe = unsafeCoerce

cx :: forall r i. Number -> IProp (cx :: Number | r) i
cx = attr (AttrName "cx") <<< show

cy :: forall r i. Number -> IProp (cy :: Number | r) i
cy = attr (AttrName "cy") <<< show

r :: forall s i. Number -> IProp (r :: Number | s) i
r = attr (AttrName "r") <<< show

viewBox :: forall r i. Number -> Number -> Number -> Number -> IProp (viewBox :: String | r) i
viewBox x_ y_ w h_ = attr (AttrName "viewBox") (joinWith " " $ map show [x_, y_, w, h_])

preserveAspectRatio :: forall r i. Maybe {x_ :: Align, y_ :: Align} -> MeetOrSlice -> IProp (preserveAspectRatio :: String | r) i
preserveAspectRatio align slice =
  attr (AttrName "preserveAspectRatio") (joinWith " " $ [align_str, printMeetOrSlice slice])
  where
    align_str = case align of
      Nothing -> "none"
      Just {x_, y_} -> joinWith "" $ ["x", printAlign x_, "Y", printAlign y_]

rx :: forall r i. Number -> IProp (rx :: Number | r) i
rx = attr (AttrName "rx") <<< show

ry :: forall r i. Number -> IProp (ry :: Number | r) i
ry = attr (AttrName "ry") <<< show

width :: forall r i. Number -> IProp (width :: Number | r) i
width = attr (AttrName "width") <<< show

height :: forall r i. Number -> IProp (height :: Number | r) i
height = attr (AttrName "height") <<< show

x :: forall r i. Number -> IProp (x :: Number | r) i
x = attr (AttrName "x") <<< show

y :: forall r i. Number -> IProp (y :: Number | r) i
y = attr (AttrName "y") <<< show

x1 :: forall r i. Number -> IProp (x1 :: Number | r) i
x1 = attr (AttrName "x1") <<< show

y1 :: forall r i. Number -> IProp (y1 :: Number | r) i
y1 = attr (AttrName "y1") <<< show

x2 :: forall r i. Number -> IProp (x2 :: Number | r) i
x2 = attr (AttrName "x2") <<< show

y2 :: forall r i. Number -> IProp (y2 :: Number | r) i
y2 = attr (AttrName "y2") <<< show

stroke :: forall r i. Maybe Color -> IProp (stroke :: String | r) i
stroke = attr (AttrName "stroke") <<< printColor

fill :: forall r i. Maybe Color -> IProp (fill :: String | r) i
fill = attr (AttrName "fill") <<< printColor

transform :: forall r i . Array Transform -> IProp (transform :: String | r) i
transform = attr (AttrName "transform") <<< joinWith " " <<< map printTransform

d :: forall r i . Array PathCommand -> IProp (d :: String | r) i
d = attr (AttrName "d") <<< joinWith " " <<< unwrapNewtype
  where
    unwrapNewtype :: Array PathCommand -> Array String
    unwrapNewtype = unsafeCoerce

text_anchor :: forall r i . TextAnchor -> IProp (text_anchor :: String | r) i
text_anchor = attr (AttrName "text-anchor") <<< printTextAnchor

font_size :: forall r i. FontSize -> IProp (font_size :: String | r) i
font_size = attr (AttrName "font-size") <<< show

dominant_baseline :: forall r i . Baseline -> IProp (transform :: String | r) i
dominant_baseline = attr (AttrName "dominant-baseline") <<< printBaseline

class_ :: forall r i . ClassName -> IProp (class :: String | r) i
class_ = attr (AttrName "class") <<< un ClassName

classes :: forall r i . Array ClassName -> IProp (class :: String | r) i
classes = attr (AttrName "class") <<< joinWith " " <<< unwrapNewtype
  where
    unwrapNewtype :: Array ClassName -> Array String
    unwrapNewtype = unsafeCoerce

id :: forall r i . String -> IProp (id :: String | r) i
id = attr (AttrName "id")

markerWidth :: forall r i. Number -> IProp (markerWidth :: Number | r) i
markerWidth = attr (AttrName "markerWidth") <<< show

markerHeight :: forall r i. Number -> IProp (markerHeight :: Number | r) i
markerHeight = attr (AttrName "markerHeight") <<< show

refX :: forall r i. Number -> IProp (refX :: Number | r) i
refX = attr (AttrName "refX") <<< show

refY :: forall r i. Number -> IProp (refY :: Number | r) i
refY = attr (AttrName "refY") <<< show

orient :: forall r i. Orient -> IProp (orient :: String | r) i
orient = attr (AttrName "orient") <<< printOrient

markerUnits :: forall r i. MarkerUnit -> IProp (markerUnits :: String | r) i
markerUnits = attr (AttrName "markerUnits") <<< printMarkerUnit

strokeWidth :: forall r i. Number -> IProp (strokeWidth :: Number | r) i
strokeWidth = attr (AttrName "stroke-width") <<< show

markerEnd :: forall r i. String -> IProp (markerEnd :: String | r) i
markerEnd = attr (AttrName "marker-end")

--------------------------------------------------------------------------------

-- | https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur
data DurationF a = Duration (Maybe a) (Maybe a) (Maybe a) (Maybe a) -- ^ TODO hours minutes seconds millis

derive instance functorDurationF :: Functor DurationF

printDurationF :: forall a. Show a => DurationF a -> String
printDurationF (Duration h_ m_ s_ i) = f "h" h_ <> f "m" m_ <> f "s" s_ <> f "i" i
  where f u = maybe "" (\val -> show val <> u)

type Duration = DurationF Number

-- TODO derive Show instance for DurationF

printDuration :: Duration -> String
printDuration = printDurationF

-- TODO add other constructors
seconds :: Number -> Duration
seconds s_ = Duration Nothing Nothing (Just s_) Nothing

data FillState = Freeze | Remove

printFillState :: FillState -> String
printFillState = case _ of
  Freeze -> "freeze"
  Remove -> "remove"

dur :: forall r i. Duration -> IProp (dur :: String | r) i
dur = attr (AttrName "dur") <<< printDuration

-- TODO ADT or free string?
attributeName :: forall r i. String -> IProp (attributeName :: String | r) i
attributeName = attr (AttrName "attributeName")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
from :: forall r i. String -> IProp (from :: String | r) i
from = attr (AttrName "from")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to
to :: forall r i. String -> IProp (to :: String | r) i
to = attr (AttrName "to")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
begin :: forall r i. String -> IProp (begin :: String | r) i
begin = attr (AttrName "begin")

repeatCount :: forall r i. Int -> IProp (repeatCount :: Int | r) i
repeatCount = attr (AttrName "repeatCount") <<< show

-- TODO this is just 'fill', but that function is already specialised to Color in this module
fillAnim :: forall r i. FillState -> IProp (fill :: String | r) i
fillAnim = attr (AttrName "fill") <<< printFillState

-- TODO xlink:href seems to have some issues, among others around its namespace
xlinkHref :: forall r i. String -> IProp (xlinkHref :: String | r) i
-- xlinkHref = attr (AttrName "xlink:href")
-- xlinkHref = attrNS (Namespace "xlink") (AttrName "href")
xlinkHref = attrNS (Namespace "xlink") (AttrName "xlink:href")

-- TODO copied from `d`; adapt where needed
path :: forall r i . Array PathCommand -> IProp (path :: String | r) i
path = attr (AttrName "path") <<< joinWith " " <<< unwrapNewtype
  where
    unwrapNewtype :: Array PathCommand -> Array String
    unwrapNewtype = unsafeCoerce
