module Halogen.Svg.Indexed.Class where

import Prelude

import Type.Row (type (+))
import Web.Clipboard.ClipboardEvent (ClipboardEvent)
import Web.UIEvent.KeyboardEvent (KeyboardEvent)
import Web.UIEvent.MouseEvent (MouseEvent)
import Web.UIEvent.WheelEvent (WheelEvent)

{-
The table below show which groups of attributes apply to which elements. This
table is compiled by looking up each attribute on MDN
(e.g., https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke)
and looking at the list labeled "You can use this attribute with the following
SVG elements:". Groups are formed from attributes that have the same element
applicability.

element            stroke | strokeEnd | strokeJoin | fill  | font  | marker
circle                X   |     -     |     -      |   X   |   -   |    X
ellipse               X   |     -     |     -      |   X   |   -   |    X
line                  X   |     X     |     -      |   -   |   -   |    X
path                  X   |     X     |     X      |   X   |   -   |    X
rect                  X   |     -     |     X      |   X   |   -   |    X
text                  X   |     X     |     X      |   X   |   X   |    -
svg                   C   |     C     |     C      |   C   |   C   |    C
g                     C   |     C     |     C      |   C   |   C   |    C
marker                C   |     C     |     C      |   C   |   C   |    C
foreignObject         C   |     C     |     C      |   C   |   C   |    C
use                   -   |     -     |     -      |   -   |   -   |    -

X indicates that the collection of attributes applies to that element
- indicates that the collection of attributes does not apply to that element
C indicates that the collection of attributes does not apply to that element
  but may apply to a child element and hence can still be set
-}

-- These core attributes are applicable to every element
type CoreAttributes r =
  ( id :: String
  , "class" :: String
  , style :: String
  , tabIndex :: Int
  , lang :: String
  , xmlns :: String
  , version :: String
  , visibility :: String
  | r)

-- Subset of events that work on Firefox 60/Chromium 66
type GlobalEventAttributes r =
  ( onClick :: MouseEvent
  , onDoubleClick :: MouseEvent
  , onContextMenu :: MouseEvent
  , onKeyDown :: KeyboardEvent
  , onKeyPress :: KeyboardEvent
  , onKeyUp :: KeyboardEvent
  , onMouseDown :: MouseEvent
  , onMouseEnter :: MouseEvent
  , onMouseLeave :: MouseEvent
  , onMouseMove :: MouseEvent
  , onMouseOut :: MouseEvent
  , onMouseOver :: MouseEvent
  , onMouseUp :: MouseEvent
  , onWheel :: WheelEvent
  | r
  )

type AriaAttributes r =
  ( "aria-activedescendant" :: String
  , "aria-atomic" :: String
  , "aria-autocomplete" :: String
  , "aria-busy" :: String
  , "aria-checked" :: String
  , "aria-colcount" :: String
  , "aria-colindex" :: String
  , "aria-colspan" :: String
  , "aria-controls" :: String
  , "aria-current" :: String
  , "aria-describedby" :: String
  , "aria-details" :: String
  , "aria-disabled" :: String
  , "aria-dropeffect" :: String
  , "aria-errormessage" :: String
  , "aria-expanded" :: String
  , "aria-flowto" :: String
  , "aria-grabbed" :: String
  , "aria-haspopup" :: String
  , "aria-hidden" :: String
  , "aria-invalid" :: String
  , "aria-keyshortcuts" :: String
  , "aria-label" :: String
  , "aria-labelledby" :: String
  , "aria-level" :: String
  , "aria-live" :: String
  , "aria-modal" :: String
  , "aria-multiline" :: String
  , "aria-multiselectable" :: String
  , "aria-orientation" :: String
  , "aria-owns" :: String
  , "aria-placeholder" :: String
  , "aria-posinset" :: String
  , "aria-pressed" :: String
  , "aria-readonly" :: String
  , "aria-relevant" :: String
  , "aria-required" :: String
  , "aria-roledescription" :: String
  , "aria-rowcount" :: String
  , "aria-rowindex" :: String
  , "aria-rowspan" :: String
  , "aria-selected" :: String
  , "aria-setsize" :: String
  , "aria-sort" :: String
  , "aria-valuemax" :: String
  , "aria-valuemin" :: String
  , "aria-valuenow" :: String
  , "aria-valuetext" :: String
  , role :: String
  | r)

type ConditionalProcessingAttributes r =
  ( requiredExtensions :: String
  , systemLanguage :: String
  | r
  )

type DocumentElementEventAttributes r =
  ( oncopy :: ClipboardEvent
  , oncut :: ClipboardEvent
  , onpaste :: ClipboardEvent
  | r
  )


-- Presentation attributes, grouped by applicability (see table above) ---------
type StrokeAttributes r =
  ( "stroke" :: String
  , "stroke-dasharray" :: String
  , "stroke-dashoffset" :: String
  , "stroke-opacity" :: String
  , "stroke-width" :: String
  | r
  )

type StrokeEndAttributes r =
  ( "stroke-linecap" :: String
  | r
  )

type StrokeJoinAttributes r =
  ( "stroke-linejoin" :: String
  , "stroke-miterlimit" :: String
  | r
  )

type FillAttributes r =
  ( "fill" :: String
  , "fill-rule" :: String
  , "fill-opacity" :: String
  | r
  )

type MarkerAttributes r =
  ( markerStart :: String
  , markerMid :: String
  , markerEnd :: String
  | r
  )

type FontAttributes r =
  ( "font-family" :: String
  , "font-size" :: String
  , "font-size-adjust" :: Number
  , "font-stretch" :: String
  , "font-style" :: String
  , "font-variant" :: String
  , "font-weight" :: String
  | r
  )

type TextAttributes r =
  ( "text-anchor" :: String
  | r
  )

type CanBeMaskedAttributes r =
  ( mask :: String
  | r
  )

type PresentationAttributes r =
  StrokeAttributes + 
  StrokeJoinAttributes + 
  StrokeEndAttributes +
  FillAttributes +
  FontAttributes +
  TextAttributes +
  MarkerAttributes +
  CanBeMaskedAttributes +
  ( transform :: String | r)

type FilterPrimitiveAttributes r =
  ( x :: Number
  , y :: Number
  , width :: Number
  , height :: Number
  , result :: String
  )