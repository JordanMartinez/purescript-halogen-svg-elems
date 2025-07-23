-- | Note: an element may contain more attributes than what
-- | we currently allow in its corresponding `SVGelemName`.
module Halogen.Svg.Indexed
  ( module Halogen.Svg.Indexed.Class
  , module Halogen.Svg.Indexed.Filter
  , module Halogen.Svg.Indexed.PaintServers
  , module Halogen.Svg.Indexed.Shapes
  )
  where


import Halogen.Svg.Indexed.Class
import Halogen.Svg.Indexed.Filter
import Halogen.Svg.Indexed.PaintServers
import Halogen.Svg.Indexed.Shapes

import Halogen.Svg.Attributes.ContentType (Color)
import Halogen.Svg.Indexed.Class (PresentationAttributes, CanBeMaskedAttributes, CoreAttributes, FillAttributes, FontAttributes, MarkerAttributes, StrokeAttributes, StrokeJoinAttributes, StrokeEndAttributes)
import Type.Row (type (+))
import Web.UIEvent.KeyboardEvent (KeyboardEvent)
import Web.UIEvent.MouseEvent (MouseEvent)
import Web.UIEvent.WheelEvent (WheelEvent)

---- Specific SVG elements ------------------------------------------------------- {-
--type SVGforeignObject = GlobalAttributes + AllPresentationAttributes
--  +
--    ( x :: Number
--    , y :: Number
--    , height :: Number
--    , width :: Number
--    )
--
--type SVGmarker = GlobalAttributes + AllPresentationAttributes
--  +
--    ( markerWidth :: Number
--    , markerHeight :: Number
--    , strokeWidth :: Number
--    , refX :: Number
--    , refY :: Number
--    , orient :: String
--    , markerUnits :: String
--    , viewBox :: String
--    )
--
--type SVGmask = GlobalAttributes + AllPresentationAttributes
--  +
--    ( transform :: String
--    , x :: Number
--    , y :: Number
--    , width :: Number
--    , height :: Number
--    , maskUnits :: String
--    , maskContentsUnits :: String
--    )
--
--type SVGpath = 
--  GlobalAttributes + 
--  CanBeMaskedAttributes + 
--  StrokeAttributes + 
--  StrokeEndAttributes +
--  StrokeJoinAttributes +
--  FillAttributes +
--  MarkerAttributes +
--    ( d :: String
--    , transform :: String
--    )
--
--type SVGpattern = GlobalAttributes
--  +
--    ( height :: Number
--    , href :: String
--    , patternContentUnits :: String
--    , patternTransform :: String
--    , patternUnits :: String
--    , preserveAspectRatio :: String
--    , viewBox :: String
--    , width :: Number
--    , x :: Number
--    , xlinkHref :: String
--    , y :: Number
--    )
--
--type SVGuse = GlobalAttributes + CanBeMaskedAttributes + StrokeAttributes + StrokeEndAttributes
--  + StrokeJoinAttributes
--  + FillAttributes
--  + FontAttributes
--  +
--    ( x :: Number
--    , y :: Number
--    , width :: Number
--    , height :: Number
--    , transform :: String
--    , href :: String
--    )
--
----------------------------------------------------------------------------------
--
--type AnimationAttributes r = GlobalAttributes
--  ( from :: String
--  , to :: String
--  , begin :: String
--  , dur :: String
--  , repeatCount :: String
--  , fill :: String
--  | r
--  )
--
--{- ^ Unlike `fill` in `GlobalAttributes`, `fill` in `AnimationAttributes` is
--intended to record a `FillState` via `fillAnim`. -}
--
--type SVGanimate = AnimationAttributes (attributeName :: String)
--
--type SVGanimateMotion = AnimationAttributes (path :: String)
--
--type SVGset = CoreAttributes + AnimationAttributes ()
--
--type SVGstop = CoreAttributes + AnimationAttributes
--  ( offset :: String
--  , stopColor :: Color
--  , stopOpacity :: Number
--  )
--
--type SVGimage = GlobalAttributes
--  ( x :: Number
--  , y :: Number
--  , width :: Number
--  , height :: Number
--  , href :: String
--  , preserveAspectRatio :: String
--  )
--
---- TODO should this have GlobalAttributes?
--type SVGmpath = (xlinkHref :: String)
--
--type SVGtitle = GlobalAttributes ()
---}