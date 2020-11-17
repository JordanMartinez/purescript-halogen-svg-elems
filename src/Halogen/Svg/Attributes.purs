module Halogen.Svg.Attributes where

-- Like Halogen.HTML.Properties
import Prelude
import Data.Maybe (Maybe(..), maybe)
import Data.String (joinWith, toUpper)
import Halogen.HTML.Core (AttrName(..), Namespace(Namespace), Prop)
import Halogen.HTML.Properties (IProp, attrNS)
import Halogen.Svg.Core as Core
import Unsafe.Coerce (unsafeCoerce)

data Color
  = RGB Int Int Int
  | RGBA Int Int Int Number

printColor :: Maybe Color -> String
printColor = case _ of
  Just (RGB r_ g_ b_) -> "rgb(" <> (joinWith "," $ map show [ r_, g_, b_ ]) <> ")"
  Just (RGBA r_ g_ b_ o) -> "rgba(" <> (joinWith "," $ map show [ r_, g_, b_ ]) <> "," <> show o <> ")"
  Nothing -> "None"

data Transform
  = Matrix Number Number Number Number Number Number
  | Translate Number Number
  | Scale Number Number
  | Rotate Number Number Number
  | SkewX Number
  | SkewY Number

data TextAnchor
  = Start
  | AnchorMiddle
  | End

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
    FontSizeLength l -> show l

printTextAnchor :: TextAnchor -> String
printTextAnchor = case _ of
  Start -> "start"
  AnchorMiddle -> "middle"
  End -> "end"

data Baseline
  = Auto
  | UseScript
  | NoChange
  | ResetSize
  | Ideographic
  | Alphabetic
  | Hanging
  | Mathematical
  | Central
  | BaselineMiddle
  | TextAfterEdge
  | TextBeforeEdge

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
  Matrix a_ b_ c_ d_ e_ f_ -> "matrix(" <> (joinWith "," $ map show [ a_, b_, c_, d_, e_, f_ ]) <> ")"
  Translate x_ y_ -> "translate(" <> (joinWith "," $ map show [ x_, y_ ]) <> ")"
  Scale x_ y_ -> "scale(" <> (joinWith "," $ map show [ x_, y_ ]) <> ")"
  Rotate a_ x_ y_ -> "rotate(" <> (joinWith "," $ map show [ a_, x_, y_ ]) <> ")"
  SkewX a_ -> "skewX(" <> show a_ <> ")"
  SkewY a_ -> "skewY(" <> show a_ <> ")"

data D
  = Rel Command
  | Abs Command

printD :: D -> String
printD = case _ of
  Abs cmd -> do
    let
      p = printCommand cmd
    (toUpper p.command) <> p.params
  Rel cmd -> do
    let
      p = printCommand cmd
    p.command <> p.params

data Command
  = M Number Number
  | L Number Number
  | C Number Number Number Number Number Number
  | S Number Number Number Number
  | Q Number Number Number Number
  | T Number Number
  | A Number Number Number Boolean Boolean Number Number
  | Z

printCommand :: Command -> { command :: String, params :: String }
printCommand = case _ of
  M x_ y_ -> { command: "m", params: joinWith "," $ map show [ x_, y_ ] }
  L x_ y_ -> { command: "l", params: joinWith "," $ map show [ x_, y_ ] }
  C x1_ y1_ x2_ y2_ x_ y_ -> { command: "c", params: joinWith "," $ map show [ x1_, y1_, x2_, y2_, x_, y_ ] }
  S x2_ y2_ x_ y_ -> { command: "s", params: joinWith "," $ map show [ x2_, y2_, x_, y_ ] }
  Q x1_ y1_ x_ y_ -> { command: "q", params: joinWith "," $ map show [ x1_, y1_, x_, y_ ] }
  T x_ y_ -> { command: "t", params: joinWith "," $ map show [ x_, y_ ] }
  A rx_ ry_ rot large sweep x_ y_ ->
    { command: "a"
    , params:
        joinWith ","
          $ map show [ rx_, ry_, rot ]
          <> [ large_flag, sweep_flag ]
          <> map show [ x_, y_ ]
    }
    where
    large_flag = if large then "0" else "1"

    sweep_flag = if sweep then "0" else "1"
  Z -> { command: "z", params: "" }

data Align
  = Min
  | Mid
  | Max

printAlign :: Align -> String
printAlign = case _ of
  Min -> "Min"
  Mid -> "Mid"
  Max -> "Max"

data MeetOrSlice
  = Meet
  | Slice

printMeetOrSlice :: MeetOrSlice -> String
printMeetOrSlice = case _ of
  Meet -> "meet"
  Slice -> "slice"

attr :: forall r i. AttrName -> String -> IProp r i
attr = coe Core.attr
  where
  coe :: (AttrName -> String -> Prop i) -> AttrName -> String -> IProp r i
  coe = unsafeCoerce

cx :: forall r i. Number -> IProp ( cx :: Number | r ) i
cx = attr (AttrName "cx") <<< show

cy :: forall r i. Number -> IProp ( cy :: Number | r ) i
cy = attr (AttrName "cy") <<< show

r :: forall s i. Number -> IProp ( r :: Number | s ) i
r = attr (AttrName "r") <<< show

viewBox :: forall r i. Number -> Number -> Number -> Number -> IProp ( viewBox :: String | r ) i
viewBox x_ y_ w h = attr (AttrName "viewBox") (joinWith " " $ map show [ x_, y_, w, h ])

preserveAspectRatio :: forall r i. Maybe { x_ :: Align, y_ :: Align } -> MeetOrSlice -> IProp ( preserveAspectRatio :: String | r ) i
preserveAspectRatio align slice = attr (AttrName "preserveAspectRatio") (joinWith " " $ [ align_str, printMeetOrSlice slice ])
  where
  align_str = case align of
    Nothing -> "none"
    Just { x_, y_ } -> joinWith "" $ [ "x", printAlign x_, "Y", printAlign y_ ]

rx :: forall r i. Number -> IProp ( rx :: Number | r ) i
rx = attr (AttrName "rx") <<< show

ry :: forall r i. Number -> IProp ( ry :: Number | r ) i
ry = attr (AttrName "ry") <<< show

width :: forall r i. Number -> IProp ( width :: Number | r ) i
width = attr (AttrName "width") <<< show

height :: forall r i. Number -> IProp ( height :: Number | r ) i
height = attr (AttrName "height") <<< show

x :: forall r i. Number -> IProp ( x :: Number | r ) i
x = attr (AttrName "x") <<< show

y :: forall r i. Number -> IProp ( y :: Number | r ) i
y = attr (AttrName "y") <<< show

x1 :: forall r i. Number -> IProp ( x1 :: Number | r ) i
x1 = attr (AttrName "x1") <<< show

y1 :: forall r i. Number -> IProp ( y1 :: Number | r ) i
y1 = attr (AttrName "y1") <<< show

x2 :: forall r i. Number -> IProp ( x2 :: Number | r ) i
x2 = attr (AttrName "x2") <<< show

y2 :: forall r i. Number -> IProp ( y2 :: Number | r ) i
y2 = attr (AttrName "y2") <<< show

stroke :: forall r i. Maybe Color -> IProp ( stroke :: String | r ) i
stroke = attr (AttrName "stroke") <<< printColor

fill :: forall r i. Maybe Color -> IProp ( fill :: String | r ) i
fill = attr (AttrName "fill") <<< printColor

transform :: forall r i. Array Transform -> IProp ( transform :: String | r ) i
transform = attr (AttrName "transform") <<< joinWith " " <<< map printTransform

d :: forall r i. Array D -> IProp ( d :: String | r ) i
d = attr (AttrName "d") <<< joinWith " " <<< map printD

text_anchor :: forall r i. TextAnchor -> IProp ( text_anchor :: String | r ) i
text_anchor = attr (AttrName "text-anchor") <<< printTextAnchor

font_size :: forall r i. FontSize -> IProp ( font_size :: String | r ) i
font_size = attr (AttrName "font-size") <<< show

dominant_baseline :: forall r i. Baseline -> IProp ( transform :: String | r ) i
dominant_baseline = attr (AttrName "dominant-baseline") <<< printBaseline

-- TODO shouldn't this be 'classes' taking an (Array Classname), like the rest of Halogen?
class_ :: forall r i. String -> IProp ( class :: String | r ) i
class_ = attr (AttrName "class")

id :: forall r i. String -> IProp ( id :: String | r ) i
id = attr (AttrName "id")

markerWidth :: forall r i. Number -> IProp ( markerWidth :: Number | r ) i
markerWidth = attr (AttrName "markerWidth") <<< show

markerHeight :: forall r i. Number -> IProp ( markerHeight :: Number | r ) i
markerHeight = attr (AttrName "markerHeight") <<< show

refX :: forall r i. Number -> IProp ( refX :: Number | r ) i
refX = attr (AttrName "refX") <<< show

refY :: forall r i. Number -> IProp ( refY :: Number | r ) i
refY = attr (AttrName "refY") <<< show

orient :: forall r i. Orient -> IProp ( orient :: String | r ) i
orient = attr (AttrName "orient") <<< printOrient

markerUnits :: forall r i. MarkerUnit -> IProp ( markerUnits :: String | r ) i
markerUnits = attr (AttrName "markerUnits") <<< printMarkerUnit

strokeWidth :: forall r i. Number -> IProp ( strokeWidth :: Number | r ) i
strokeWidth = attr (AttrName "stroke-width") <<< show

markerEnd :: forall r i. String -> IProp ( markerEnd :: String | r ) i
markerEnd = attr (AttrName "marker-end")

--------------------------------------------------------------------------------
-- | https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur
data DurationF a
  = Duration (Maybe a) (Maybe a) (Maybe a) (Maybe a) -- ^ TODO hours minutes seconds millis

derive instance functorDurationF :: Functor DurationF

printDurationF :: forall a. Show a => DurationF a -> String
printDurationF (Duration h m s i) = f "h" h <> f "m" m <> f "s" s <> f "i" i
  where
  f u = maybe "" (\v -> show v <> u)

type Duration
  = DurationF Number

-- TODO derive Show instance for DurationF
printDuration :: Duration -> String
printDuration = printDurationF

-- TODO add other constructors
seconds :: Number -> Duration
seconds s = Duration Nothing Nothing (Just s) Nothing

data FillState
  = Freeze
  | Remove

printFillState :: FillState -> String
printFillState = case _ of
  Freeze -> "freeze"
  Remove -> "remove"

dur :: forall r i. Duration -> IProp ( dur :: String | r ) i
dur = attr (AttrName "dur") <<< printDuration

-- TODO ADT or free string?
attributeName :: forall r i. String -> IProp ( attributeName :: String | r ) i
attributeName = attr (AttrName "attributeName")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from
from :: forall r i. String -> IProp ( from :: String | r ) i
from = attr (AttrName "from")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to
to :: forall r i. String -> IProp ( to :: String | r ) i
to = attr (AttrName "to")

-- https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin
begin :: forall r i. String -> IProp ( begin :: String | r ) i
begin = attr (AttrName "begin")

repeatCount :: forall r i. Int -> IProp ( repeatCount :: Int | r ) i
repeatCount = attr (AttrName "repeatCount") <<< show

-- TODO this is just 'fill', but that function is already specialised to Color in this module
fillAnim :: forall r i. FillState -> IProp ( fill :: String | r ) i
fillAnim = attr (AttrName "fill") <<< printFillState

href :: forall r i. String -> IProp ( href :: String | r ) i
href = attr (AttrName "href")

-- TODO xlink:href seems to have some issues, among others around its namespace
xlinkHref :: forall r i. String -> IProp ( xlinkHref :: String | r ) i
-- xlinkHref = attr (AttrName "xlink:href")
-- xlinkHref = attrNS (Namespace "xlink") (AttrName "href")
xlinkHref = attrNS (Namespace "xlink") (AttrName "xlink:href")

-- TODO copied from `d`; adapt where needed
path :: forall r i. Array D -> IProp ( path :: String | r ) i
path = attr (AttrName "path") <<< joinWith " " <<< map printD
