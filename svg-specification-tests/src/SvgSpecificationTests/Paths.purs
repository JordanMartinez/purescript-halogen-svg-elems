module SvgSpecificationTests.Paths where

import Prelude

import Data.Tuple (Tuple(..))
import Halogen.HTML (ClassName(..), HTML(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HA
import Halogen.HTML.Properties as HE
import Halogen.Svg.Attributes (Length(..), Paint)
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Attributes.ContentType (Length(..), Transform(..))
import Halogen.Svg.Attributes.HasClasses (none)
import Halogen.Svg.Attributes.Path (LargeArcFlag(..), PathCommand(..), SweepFlag(..), h, a, z, v, l, m, c, s, q, t)
import Halogen.Svg.Elements.Paths as SE
import Halogen.Svg.Elements.Shapes as SE
import Halogen.Svg.Elements.Struct as SE
import Halogen.Svg.Elements.Text as SE
import SvgSpecificationTests.References (ReferenceTest)

referenceTests :: forall p i. Array (ReferenceTest p i)
referenceTests =
  [ { referenceURL: "./references/paths/arcs01.svg", actualSVG: arcs01 }
  , { referenceURL: "./references/paths/cubic01.svg", actualSVG: cubic01 }
  , { referenceURL: "./references/paths/quad01.svg", actualSVG: quad01 }
  , { referenceURL: "./references/paths/triangle01.svg", actualSVG: triangle01 }
  ]

arcs01 :: forall p i. HTML p i
arcs01 =
  SE.svg
    [ SA.width (Cm 12.0) , SA.height (Cm 5.25) , SA.viewBox 0.0 0.0 1200.0 400.0
    , SA.xmlns "http://www.w3.org/2000/svg"
    ]
    [ SE.title [] [ HH.text "Example arcs01 - arc commands in path data" ]
    , SE.desc [] [ HH.text "Picture of a pie chart with two pie wedges and a picture of a line with arc blips" ]
    , SE.rect
      [ SA.x 1, SA.y 1, SA.width 1198, SA.height 398
      , SA.fill "none", SA.stroke "blue", SA.strokeWidth 1 ] []
    , SE.path
      [ SA.d
        [ M 300.0 200.0
        , h (-150.0)
        , a 150.0 150.0 0.0 Arc1 Sweep0 150.0 (-150.0)
        , z ]
      , SA.fill "red", SA.stroke "blue", SA.strokeWidth 5 ] []
    , SE.path
      [ SA.d
        [ M 275.0 175.0
        , v (-150.0)
        , a 150.0 150.0 0.0 Arc0 Sweep0 (-150.0) 150.0
        , Z ]
      , SA.fill "yellow", SA.stroke "blue", SA.strokeWidth 5 ] []
    , SE.path
      [ SA.d
        [ M 600.0 350.0, l 50.0 (-25.0)
        , a 25.0 25.0  (-30.0) Arc0 Sweep1 50.0 (-25.0), l 50.0 (-25.0)
        , a 25.0 50.0  (-30.0) Arc0 Sweep1 50.0 (-25.0), l 50.0 (-25.0)
        , a 25.0 75.0  (-30.0) Arc0 Sweep1 50.0 (-25.0), l 50.0 (-25.0)
        , a 25.0 100.0 (-30.0) Arc0 Sweep1 50.0 (-25.0), l 50.0 (-25.0)
        ]
      , SA.fill "none", SA.stroke "red", SA.strokeWidth 5 ] []
    ]

{-
<svg width="12cm" height="5.25cm" viewBox="0 0 1200 400"
     xmlns="http://www.w3.org/2000/svg" version="1.1">
  <title>Example arcs01 - arc commands in path data</title>
  <desc>Picture of a pie chart with two pie wedges and
        a picture of a line with arc blips</desc>
  <rect x="1" y="1" width="1198" height="398"
        fill="none" stroke="blue" stroke-width="1" />

  <path d="M300,200 h-150 a150,150 0 1,0 150,-150 z"
        fill="red" stroke="blue" stroke-width="5" />
  <path d="M275,175 v-150 a150,150 0 0,0 -150,150 z"
        fill="yellow" stroke="blue" stroke-width="5" />

  <path d="M600,350 l 50,-25 
           a25,25 -30 0,1 50,-25 l 50,-25 
           a25,50 -30 0,1 50,-25 l 50,-25 
           a25,75 -30 0,1 50,-25 l 50,-25 
           a25,100 -30 0,1 50,-25 l 50,-25"
        fill="none" stroke="red" stroke-width="5"  />
</svg>

-}


cubic01 :: forall p i. HTML p i
cubic01 =
  SE.svg
    [ SA.xmlns "http://www.w3.org/2000/svg"
    , SA.width (Cm 5.0)
    , SA.height (Cm 4.0)
    , SA.viewBox 0.0 0.0 500.0 400.0
    , SA.version "1.1"
    ]
    [ SE.title [] [ HH.text "Example cubic01- cubic Bézier commands in path data" ]
    , SE.desc [] [ HH.text "Picture showing a simple example of path data using both a \"C\" and an \"S\" command, along with annotations showing the control points and end points" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 498.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 1.0 ] []
    , connect [Tuple 100 200, Tuple 100 100]
    , connect [Tuple 250 100, Tuple 250 200]
    , connect [Tuple 250 200, Tuple 250 300]
    , connect [Tuple 400 300, Tuple 400 200]
    , SE.path
      [ SA.d
        [ M 100.0 200.0
        , C 100.0 100.0 250.0 100.0 250.0 200.0
        , S 400.0 300.0 400.0 200.0 ]
      , SA.fill "none"
      , SA.stroke "red"
      , SA.strokeWidth 5.0
      ] []
    , endPoint 100 200
    , endPoint 250 200
    , endPoint 400 200
    , ctlPoint 100 100
    , ctlPoint 250 100
    , ctlPoint 400 300
    , autoCtlPoint 250 300
    , SE.text [ SA.x 25, SA.y 70 ] [ HH.text "M100,200 C100,100 250,100 250,200" ]
    , SE.text [ SA.x 325, SA.y 350, HA.style "text-anchor:middle" ] [ HH.text "S400,300 400,200" ]
    ]
  where
    connect (points :: Array (Tuple Int Int)) = SE.polyline
      [ SA.fill "none", SA.stroke "#888888", SA.strokeWidth 2, SA.points points ] []

    endPoint (cx:: Int) (cy:: Int) = SE.circle
      [ SA.fill "none", SA.stroke "#888888", SA.strokeWidth 2
      , SA.cx cx, SA.cy cy, SA.r 10 ] []
    
    ctlPoint (cx:: Int) (cy:: Int) = SE.circle
      [ SA.fill "#888888", SA.stroke "none", SA.cx cx, SA.cy cy, SA.r 10 ] []
    
    autoCtlPoint (cx:: Int) (cy:: Int) = SE.circle
      [ SA.fill "none", SA.stroke "blue", SA.strokeWidth 4, SA.cx cx, SA.cy cy, SA.r 9 ] []

quad01 :: forall p i. HTML p i
quad01 =
  SE.svg
    [ SA.width (Cm 12.0)
    , SA.height (Cm 6.0)
    , SA.viewBox 0.0 0.0 1200.0 600.0
    ]
    [ SE.title [] [ HH.text "Example quad01 - quadratic Bézier commands in path data" ]
    , SE.desc [] [ HH.text "Picture showing a \"Q\" a \"T\" command, along with annotations showing the control points and end points" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 598.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 1.0 ] []
    , SE.path
      [ SA.d [ M 200.0 300.0, Q 400.0 50.0 600.0 300.0, T 1000.0 300.0 ]
      , SA.fill "none"
      , SA.stroke "red"
      , SA.strokeWidth 5.0 ] []
    , SE.g [ SA.fill "black" ]
      [ SE.circle [ SA.cx 200, SA.cy 300, SA.r 10 ] []
      , SE.circle [ SA.cx 600, SA.cy 300, SA.r 10 ] []  
      , SE.circle [ SA.cx 1000, SA.cy 300, SA.r 10 ] []
      ]
    , SE.g [ SA.fill "#888888" ]
      [ SE.circle [ SA.cx 400, SA.cy 50, SA.r 10 ] []
      , SE.circle [ SA.cx 800, SA.cy 550, SA.r 10 ] []
      ]
    , SE.path 
      [ SA.d [ M 200.0 300.0, L 400.0 50.0, L 600.0 300.0, L 800.0 550.0, L 1000.0 300.0 ]
      , SA.fill "none"
      , SA.stroke "#888888"
      , SA.strokeWidth 2.0
      ] []
    ]

triangle01 :: forall p i. HTML p i
triangle01 =
  SE.svg
    [ SA.width (Cm 4.0)
    , SA.height (Cm 4.0)
    , SA.viewBox 0.0 0.0 400.0 400.0
    ]
    [ SE.title [] [ HH.text "Example triangle01- simple example of a 'path'" ]
    , SE.desc [] [ HH.text "A path that draws a triangle" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 398.0, SA.height 398.0, SA.fill "none", SA.stroke "blue" ] []
    , SE.path
      [ SA.d [ M 100.0 100.0, L 300.0 100.0, L 200.0 300.0, Z]
      , SA.fill "red"
      , SA.stroke "blue"
      , SA.strokeWidth 3.0 ] []
    ]

