module SvgSpecificationTests.Painting where

import Prelude

import Halogen.HTML (HTML(..))
import Halogen.HTML as HH
import Halogen.Svg.Attributes (FillRule(..), FontWeight(..), Length(..), Paint, Percentage(..), StrokeLineCap(..), StrokeLineJoin(..), TextAnchor(..), Transform(..), URL(..))
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Attributes.ContentType (Length(..), Transform(..))
import Halogen.Svg.Attributes.Filter (FilterUnits(..))
import Halogen.Svg.Attributes.HasClasses (none)
import Halogen.Svg.Attributes.Path (LargeArcFlag(..), PathCommand(..), SweepFlag(..))
import Halogen.Svg.Elements as SE
import SvgSpecificationTests.References (ReferenceTest)

referenceTests :: forall p i. Array (ReferenceTest p i)
referenceTests =
  [ { referenceURL: "./references/painting/dashes.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/dashoffset.svg", actualSVG: dashOffset }
  , { referenceURL: "./references/painting/dash-pathlength.svg", actualSVG: dashPathLength }
  , { referenceURL: "./references/painting/fallback_paint.svg", actualSVG: fallbackPaint }
  , { referenceURL: "./references/painting/fillrule-evenodd.svg", actualSVG: fillRuleEvenOdd }
  , { referenceURL: "./references/painting/fillrule-nonzero.svg", actualSVG: fillRuleNonZero }
  , { referenceURL: "./references/painting/linecap-construction.svg", actualSVG: lineCapConstruction }
  , { referenceURL: "./references/painting/linecap.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/linejoin-construction-arcs.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/linejoin-construction-fallback2.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/linejoin-construction-fallback3.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/linejoin-construction-fallback.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/linejoin-construction.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/linejoin-four.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/marker-context.svg11.svg", actualSVG: markerContext }
  , { referenceURL: "./references/painting/marker-doubled.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/marker-rendering.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/miter-limit-def.svg", actualSVG: dashes }
  , { referenceURL: "./references/painting/miter-limit.svg", actualSVG: miterLimit }
  , { referenceURL: "./references/painting/paintorder.svg", actualSVG: paintOrder }
  , { referenceURL: "./references/painting/will-change-image.svg", actualSVG: willChangeImage }
  ]

dashes :: forall p i. HTML p i
dashes =
  SE.svg
    [ SA.viewBox 0.0 0.0 300.0 150.0
    , SA.width (Px 300.0)
    , SA.height (Px 150.0)
    ]
    [ SE.g [ SA.transform [ Translate 0.0 (-10.0) ] , SA.fill "none" ]
      [ SE.path
        [ SA.stroke "#444"
        , SA.strokeWidth 20.0
        , SA.d [ M 50.0 50.0, C 250.0 50.0 50.0 150.0 250.0 100.0 ]
        , SA.strokeDashArray [20, 10]
        ] []
      , SE.path
        [ SA.stroke "crimson"
        , SA.strokeWidth 2.0
        , SA.d [ M 50.0 50.0, C 250.0 50.0 50.0 150.0 250.0 100.0 ] ] []
      ]
    ]
  
dashOffset :: forall p i. HTML p i
dashOffset =
  SE.svg
    [ SA.viewBox 0.0 0.0 300.0 150.0
    , SA.width (Px 300.0)
    , SA.height (Px 150.0)
    ]
    [ SE.g [ SA.transform [ Translate 0.0 (-10.0) ] , SA.fill "none" ]
      [ SE.path
        [ SA.stroke "#444"
        , SA.strokeWidth 20.0
        , SA.d [ M 50.0 50.0, C 250.0 50.0 50.0 150.0 250.0 100.0 ]
        , SA.strokeDashArray [20, 10]
        , SA.strokeDashOffset 10.0
        ] []
      , SE.path
        [ SA.stroke "crimson"
        , SA.strokeWidth 2.0
        , SA.d [ M 50.0 50.0, C 250.0 50.0 50.0 150.0 250.0 100.0 ] ] []
      ]
    ]

dashPathLength :: forall p i. HTML p i
dashPathLength =
  SE.svg
    [ SA.viewBox 0.0 0.0 300.0 150.0
    , SA.width (Px 300.0)
    , SA.height (Px 150.0)
    , SA.xmlns "http://www.w3.org/2000/svg"
    ]
    [ SE.defs []
      [ SE.path
        [ SA.id "p"
        , SA.d
          [ M (-50.0) 0.0
          , A 50.0 50.0 0.0 Arc0 Sweep0 50.0 0.0
          , A 50.0 50.0 0.0 Arc0 Sweep0 (-50.0) 0.0
          , Z
          ]
        , SA.pathLength 80.0 ] []
      , SE.g [ SA.id "chip", SA.strokeWidth 10.0 ]
        [ SE.circle
          [ SA.cy 5.0
          , SA.r 55.0
          , SA.fill "black"
          , SA.fillOpacity 0.15
          , SA.stroke "none" ] []
        , SE.use [ SA.href (URL "#p") ] []
        , SE.use
          [ SA.href (URL "#p")
          , SA.fill "none"
          , SA.stroke "#eee"
          , SA.strokeWidth 10.0
          , SA.strokeDashArray [10, 10]
          , SA.strokeDashOffset 5.0 ] []
        , SE.g
          [ SA.fill "none"
          , SA.strokeWidth 5.0
          , SA.strokeDashArray [0, 20]
          , SA.strokeLineCap StrokeLineCapRound
          ]
          [ SE.use [ SA.href (URL "#p"), SA.stroke "#eee", SA.strokeDashOffset 10.0 ] []
          , SE.use [ SA.href (URL "#p"), SA.strokeDashOffset 0.0 ] []
          ]
        , SE.circle [ SA.r 40.0, SA.fill "black", SA.fillOpacity 0.15, SA.strokeWidth 2.0, SA.stroke "white" ] []
        ]
      ]
    , SE.rect [ SA.width (Percentage 100.0), SA.height (Percentage 100.0), SA.fill "#063" ] []
    , SE.use [ SA.href (URL "#chip"), SA.x (Px 140.0), SA.y (Px 75.0), SA.fill "#00c", SA.stroke "#00c" ] []
    , SE.use [ SA.href (URL "#chip"), SA.x (Px 160.0), SA.y (Px 85.0), SA.fill "#000", SA.stroke "#000" ] []
    , SE.use [ SA.href (URL "#chip"), SA.x (Px 170.0), SA.y (Px 65.0), SA.fill "#c00", SA.stroke "#c00" ] []
    ]

fallbackPaint :: forall p i. HTML p i
fallbackPaint =
  SE.svg
    [ SA.viewBox 0.0 0.0 300.0 150.0
    , SA.width (Px 300.0)
    , SA.height (Px 150.0)
    ]
    [ SE.defs []
      [ SE.pattern
        [ SA.id "Hatch"
        , SA.patternUnits UserSpaceOnUse
        , SA.patternTransform ( Rotate 45.0 0.0 0.0 )
        , SA.width (Px 10.0)
        , SA.height (Px 300.0)
        ]
        [ SE.path
          [ SA.strokeWidth 2.0
          , SA.stroke "black"
          , SA.d [ M 1.0 0.0, L 1.0 300.0 ]
          ] []
        ]
      ]
    , SE.g [ SA.stroke "black", SA.strokeWidth 2.0 ]
      [ SE.rect
        [ SA.fill (URL "#Hatch")
        , SA.x (Px 25.0)
        , SA.y (Px 25.0)
        , SA.width (Px 100.0)
        , SA.height (Px 100.0) ] []
      , SE.rect
        [ SA.fill "powderblue"
        , SA.x (Px 175.0)
        , SA.y (Px 25.0)
        , SA.width (Px 100.0)
        , SA.height (Px 100.0) ] []
      ]
    ]

fillRuleEvenOdd :: forall p i. HTML p i
fillRuleEvenOdd =
  SE.svg
    [ SA.viewBox 0.0 0.0 1200.0 400.0
    , SA.width (Cm 12.0)
    , SA.height (Cm 4.0)
    ]
    [ SE.defs []
      [ SE.path [ SA.id "Triangle", SA.d "M 16,0 L -8,9 v-18 z", SA.fill "black", SA.stroke "none" ] []
      ]
    , SE.g [ SA.fillRule EvenOdd, SA.fill "red", SA.stroke "black", SA.strokeWidth 3.0 ]
      [ SE.path [ SA.d "M 250,75 L 323,301 131,161 369,161 177,301 z" ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 306.21 249.0, Rotate 72.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 175.16 193.2, Rotate 216.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 314.26 161.0, Rotate 0.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 221.16 268.8, Rotate 144.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 233.21 126.98, Rotate 288.0 0.0 0.0 ] ] []
      , SE.path [ SA.d "M 600,81 A 107,107 0 0,1 600,295 A 107,107 0 0,1 600,81 z M 600,139 A 49,49 0 0,1 600,237 A 49,49 0 0,1 600,139 z" ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 0.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 120.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 240.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 60.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 180.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 300.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.path [ SA.d "M 950,81 A 107,107 0 0,1 950,295 A 107,107 0 0,1 950,81 z M 950,139 A 49,49 0 0,0 950,237 A 49,49 0 0,0 950,139 z" ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 0.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 120.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 240.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 60.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 180.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 300.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      ]
    ]

fillRuleNonZero :: forall p i. HTML p i
fillRuleNonZero =
  SE.svg
    [ SA.viewBox 0.0 0.0 1200.0 400.0
    , SA.width (Cm 12.0)
    , SA.height (Cm 4.0)
    ]
    [ SE.defs []
      [ SE.path [ SA.id "Triangle", SA.d "M 16,0 L -8,9 v-18 z", SA.fill "black", SA.stroke "none" ] []
      ]
    , SE.g [ SA.fillRule NonZero, SA.fill "red", SA.stroke "black", SA.strokeWidth 3.0 ]
      [ SE.path [ SA.d "M 250,75 L 323,301 131,161 369,161 177,301 z" ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 306.21 249.0, Rotate 72.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 175.16 193.2, Rotate 216.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 314.26 161.0, Rotate 0.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 221.16 268.8, Rotate 144.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 233.21 126.98, Rotate 288.0 0.0 0.0 ] ] []
      , SE.path [ SA.d "M 600,81 A 107,107 0 0,1 600,295 A 107,107 0 0,1 600,81 z M 600,139 A 49,49 0 0,1 600,237 A 49,49 0 0,1 600,139 z" ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 0.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 120.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 240.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 60.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 180.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 600.0 188.0, Rotate 300.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.path [ SA.d "M 950,81 A 107,107 0 0,1 950,295 A 107,107 0 0,1 950,81 z M 950,139 A 49,49 0 0,0 950,237 A 49,49 0 0,0 950,139 z" ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 0.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 120.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 240.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 60.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 180.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 300.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 0.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 120.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 240.0 0.0 0.0, Translate 107.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 60.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 180.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      , SE.use [ SA.href (URL "#Triangle"), SA.transform [ Translate 950.0 188.0, Rotate 300.0 0.0 0.0, Translate 49.0 0.0, Rotate 90.0 0.0 0.0 ] ] []
      ]
    ]

lineCapConstruction :: forall p i. HTML p i
lineCapConstruction =
  SE.svg
    [ SA.viewBox 0.0 0.0 600.0 350.0
    , SA.width (Px 600.0)
    , SA.height (Px 350.0)
    ] $
    map lineCapCol
      [ { lineCap: StrokeLineCapButt, title: "'butt' cap", translate: Translate (-30.0) 0.0 }
      , { lineCap: StrokeLineCapRound, title: "'round' cap", translate: Translate 150.0 0.0 }
      , { lineCap: StrokeLineCapSquare, title: "'square' cap", translate: Translate 330.0 0.0 }
      ]
  where
    lineCapCol :: { lineCap :: StrokeLineCap, title :: String, translate :: Transform } -> HTML p i
    lineCapCol { lineCap, title, translate } = 
      SE.g
        [ SA.textAnchor TextAnchorMiddle
        , SA.fontFamily "sans-serif"
        , SA.fontSize (Px 16.0) ]
        [ SE.g
          [ SA.transform translate ]
          [ SE.path
            [ SA.d "M 100,100 C 200,100 100,200 200,150"
            , SA.fill "none"
            , SA.stroke "#444"
            , SA.strokeWidth 20.0
            , SA.strokeLineCap lineCap
            ] []
          , SE.path
            [ SA.d "M 100,100 C 200,100 100,200 200,150"
            , SA.fill "none"
            , SA.stroke "#ccc"
            , SA.strokeWidth 2.0
            , SA.strokeLineCap lineCap
            ] []
          , SE.g [ SA.stroke "#ccc", SA.strokeWidth 1.0 ]
            [ SE.g [ SA.stroke "#6a9100" ]
              [ SE.path [ SA.d "M 60,100 h 80", SA.transform [ Rotate 90.0 100.0 100.0 ] ] []
              , SE.path [ SA.d "M -40,0 h 80", SA.transform [ Translate 200.0 150.0, Rotate 65.0 0.0 0.0 ] ] []
              ]
            ]
          , SE.text [ SA.x 150, SA.y 40 ] [ HH.text title ]
          ]
        ]


markerContext :: forall p i. HTML p i
markerContext =
  SE.svg
    [ SA.viewBox 0.0 0.0 100.0 100.0
    , SA.width (Px 100.0)
    , SA.height (Px 100.0)
    ]
    [ SE.path [ SA.fill "none", SA.strokeWidth 4.0 ] []
    --, SE.marker [ SA.id "diamond-red", SA.markerWidth (Px 12.0), SA.markerHeight (Px 12.0), SA.refX (Px 6.0), SA.refY (Px 6.0), SA.markerUnits UserSpaceOnUse ]
    --  [ SE.circle [ SA.cx 6.0, SA.cy 6.0, SA.r 4.0, SA.fill "white", SA.stroke "red", SA.strokeWidth 3.0 ]
    --  ]
    --, SE.marker [ SA.id "diamond-green", SA.markerWidth 12.0, SA.markerHeight 12.0, SA.refX 6.0, SA.refY 6.0, SA.markerUnits UserSpaceOnUse ]
    --  [ SE.circle [ SA.cx 6.0, SA.cy 6.0, SA.r 4.0, SA.fill "white", SA.stroke "green", SA.strokeWidth 3.0 ]
    --  ]
    --, SE.marker [ SA.id "diamond-blue", SA.markerWidth 12.0, SA.markerHeight 12.0, SA.refX 6.0, SA.refY 6.0, SA.markerUnits UserSpaceOnUse ]
    --  [ SE.circle [ SA.cx 6.0, SA.cy 6.0, SA.r 4.0, SA.fill "white", SA.stroke "blue", SA.strokeWidth 3.0 ]
    --  ]
    ]

miterLimit :: forall p i. HTML p i
miterLimit =
  SE.svg
    [ SA.width (Px 600.0) , SA.height (Px 180.0) , SA.viewBox 0.0 0.0 600.0 180.0 ]
    [ HH.style_ [ HH.text "" ]
    , SE.defs []
      [ SE.path [ SA.id "path1", SA.d "m 25,60 150,30 -150,30", SA.fill "none", SA.strokeMiterLimit 10.0 ] []
      , SE.circle [ SA.id "circle1", SA.cx 175.0, SA.cy 90.0, SA.r 4.0 ] []
      , SE.path [ SA.id "limit", SA.d "m 227.5,30 0,120", SA.fill "none", SA.stroke "#6a9100", SA.strokeDashArray 4.0 ] []
      --, SE.clipPath [ SA.id "clip1" ]
      --  [ SE.rect [ SA.width 227.5, SA.height (Percentage 100.0) ] [] ]
      ]
    , SE.g [ SA.transform [ Translate 0.0 0.0 ] ]
      [ SE.use [ SA.href (URL "#path1"), SA.strokeLineJoin StrokeLineJoinMiter ] []
      , SE.use [ SA.href (URL "#path1"), SA.strokeLineJoin StrokeLineJoinBevel, SA.stroke "black" ] []
      , SE.use [ SA.href (URL "#path1") ] []
      , SE.use [ SA.href (URL "#circle1") ] []
      , SE.use [ SA.href (URL "#limit") ] []
      , SE.text [ SA.x 150.0, SA.y 150.0 ] [ HH.text "‘miter’ join" ]
      ]
    , SE.g [ SA.transform [ Translate 300.0 0.0 ] ]
      [ SE.use [ SA.href (URL "#path1"), SA.strokeLineJoin StrokeLineJoinMiter ] []
      --, SE.use [ SA.href (URL "#path1"), SA.strokeLineJoin StrokeLineJoinBevel, SA.stroke "black", SA.clipPath (URL "#clip1") ] []
      , SE.use [ SA.href (URL "#path1") ] []
      , SE.use [ SA.href (URL "#circle1") ] []
      , SE.use [ SA.href (URL "#limit") ] []
      , SE.text [ SA.x 150.0, SA.y 150.0 ] [ HH.text "‘miter-clip’ join" ]
      ]
    ]

{-
<?xml version="1.0" standalone="no"?>
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
     width="600" height="180" viewBox="0 0 600 180">
  <desc>Example stroke miter limit - demonstrates effect of miter limit.</desc>
  <style type="text/css"><![CDATA[
    .thick { stroke: gray; stroke-width: 35px }
    .thin { stroke: #ccc; stroke-width: 2px }
    text { text-anchor: middle; font: 16px sans-serif }
    circle { fill: #ccc; stroke: none }
  ]]></style>
  <defs>
    <path id="path1" d="m 25,60 150,30 -150,30" style="fill:none;stroke-miterlimit:10"/>
    <circle id="circle1" cx="175" cy="90" r="4"/>
    <path id="limit" d="m 227.5,30 0,120" style="fill:none;stroke:#6a9100;stroke-dasharray:4"/>
    <clipPath id="clip1">
      <rect width="227.5" height="100%"/>
    </clipPath>
  </defs>

  <g transform="translate(0,0)">
    <use class="thick" xlink:href="#path1" stroke-linejoin="miter"/>
    <use class="thick" xlink:href="#path1" stroke-linejoin="bevel" style="stroke:black"/>
    <use class="thin" xlink:href="#path1"/>
    <use xlink:href="#circle1"/>
    <use xlink:href="#limit"/>
    <text x="150" y="150">‘miter’ join</text>
  </g>

  <g transform="translate(300,0)">
    <use class="thick" xlink:href="#path1" stroke-linejoin="miter"/>
    <use class="thick" xlink:href="#path1" stroke-linejoin="miter" style="stroke:black;clip-path:url(#clip1)"/>
    <use class="thin" xlink:href="#path1"/>
    <use xlink:href="#circle1"/>
    <use xlink:href="#limit"/>
    <text x="150" y="150">‘miter-clip’ join</text>
  </g>
</svg>


-}

paintOrder :: forall p i. HTML p i
paintOrder =
  SE.svg
    [ SA.viewBox 0.0 0.0 600.0 150.0
    , SA.width (Px 600.0)
    , SA.height (Px 150.0)
    ]
    [ SE.g
      [ SA.fontFamily "sans-serif"
      , SA.fontSize (Px 80.0)
      , SA.fontWeight FontWeightBold
      , SA.strokeWidth (Px 6.0)
      , SA.strokeLineJoin StrokeLineJoinMiter
      , SA.textAnchor TextAnchorMiddle
      ]
      [ SE.text [ SA.x (Px 150.0), SA.y (Px 100.0), SA.fill "peachpuff", SA.stroke "crimson" ] [ HH.text "pizazz" ]
      , SE.g [ SA.strokeWidth (Px 12.0) ]
        [ SE.text [ SA.x (Px 450.0), SA.y (Px 100.0), SA.fill "none", SA.stroke "crimson" ] [ HH.text "pizazz" ]
        , SE.text [ SA.x (Px 450.0), SA.y (Px 100.0), SA.fill "peachpuff", SA.stroke "none" ] [ HH.text "pizazz" ]
        ]
      ]
    ]

willChangeImage :: forall p i. HTML p i
willChangeImage =
  SE.svg
    [ SA.width (Px 400.0) , SA.height (Px 300.0) ]
    [ HH.style_ [ HH.text style ]
    , SE.g []
      [ SE.rect [ SA.id "background", SA.width (Percentage 100.0), SA.height (Percentage 100.0) ] []
      , SE.text [ SA.x 10.0, SA.y 30.0 ] [ HH.text "Drag the star!" ]
      , SE.path
        [ SA.id "star1"
        , SA.transform [ Translate 200.0 150.0 ]
        , SA.d
          [ M 0.00 (-40.00), L (-11.76) (-16.18), L (-38.04) (-12.36), L (-19.02) 6.18
          , L (-23.51) 32.36, L 0.00 20.00, L 23.51 32.36, L 19.02 6.18, L 38.04 (-12.36)
          , L 11.76 (-16.18), Z ]
        ] []
      , SE.path
        [ SA.id "star2"
        , SA.transform [ Translate 200.0 150.0 ]
        , SA.d 
          [ M 0.00 (-40.00), L (-11.76) (-16.18), L (-38.04) (-12.36), L (-19.02) 6.18
          , L (-23.51) 32.36, L 0.00 20.00, L 23.51 32.36, L 19.02 6.18, L 38.04 (-12.36)
          , L 11.76 (-16.18), Z ]
        ] []
      ]
    ]
  where
    style = "" -- todo: make styles work without affecting other tests
    --style = """
    --#background { fill: lemonchiffon; }
    --#star1 {
    --  fill: none;
    --  stroke: navy; stroke-width: 5px; stroke-linejoin: round;
    --}
    --#star2 {
    --  fill: cornflowerblue;
    --}
    --text { font: 24px sans-serif; }
    --"""