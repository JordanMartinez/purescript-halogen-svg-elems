module SvgSpecificationTests.Shapes where

import Prelude

import Data.Tuple (Tuple(..))
import Halogen.HTML (HTML(..))
import Halogen.HTML as HH
import Halogen.Svg.Attributes (Paint)
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Attributes.ContentType (Length(..), Transform(..))
import Halogen.Svg.Attributes.HasClasses (none)
import Halogen.Svg.Elements as SE
import SvgSpecificationTests.References (ReferenceTest)


referenceTests :: forall p i. Array (ReferenceTest p i)
referenceTests =
  [ { referenceURL: "./references/shapes/rect01.svg" , actualSVG: rect01 }
  , { referenceURL: "./references/shapes/rect02.svg" , actualSVG: rect02 }
  , { referenceURL: "./references/shapes/circle01.svg" , actualSVG: circle01 }
  , { referenceURL: "./references/shapes/ellipse01.svg" , actualSVG: ellipse01 }
  , { referenceURL: "./references/shapes/line01.svg" , actualSVG: line01 }
  , { referenceURL: "./references/shapes/polyline01.svg" , actualSVG: polyline01 }
  , { referenceURL: "./references/shapes/polygon01.svg" , actualSVG: polygon01 }
  ]


rect01 :: forall p i. HTML p i
rect01 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example of a rectangle" ]
    , SE.rect
      [ SA.x 1.0
      , SA.y 1.0
      , SA.width 1198.0
      , SA.height 398.0
      , SA.fill "none"
      , SA.stroke "blue"
      , SA.strokeWidth 2.0 ]
      []
    , SE.rect
      [ SA.x 400.0
      , SA.y 100.0
      , SA.width 400.0
      , SA.height 200.0
      , SA.fill "yellow"
      , SA.stroke "navy"
      , SA.strokeWidth 10.0 ]
      []
    ]

rect02 :: forall p i. HTML p i
rect02 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example rect02 - rounded rectangles" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    , SE.rect [ SA.x 100.0, SA.y 100.0, SA.width 400.0, SA.height 200.0, SA.rx 50.0, SA.fill "green" ] []
    , SE.g [ SA.transform [Translate 700.0 210.0, Rotate (-30.0) 0.0 0.0] ]
      [ SE.rect
        [ SA.x 0.0, SA.y 0.0, SA.width 400.0, SA.height 200.0, SA.rx 50.0, SA.fill "none", SA.stroke "purple", SA.strokeWidth 30.0 ] []
      ]
    ]

circle01 :: forall p i. HTML p i
circle01 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example circle01 - circle filled with red and stroked with blue" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    , SE.circle [ SA.cx 600.0, SA.cy 200.0, SA.r 100.0, SA.fill "red", SA.stroke "blue", SA.strokeWidth 10.0 ] []
    ]

ellipse01 :: forall p i. HTML p i
ellipse01 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example ellipse01 - examples of ellipses" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    , SE.g [ SA.transform [Translate 300.0 200.0] ]
      [ SE.ellipse
        [ SA.rx 250.0, SA.ry 100.0, SA.fill "red" ] []
      ]
    , SE.ellipse
      [ SA.transform
        [ Translate 900.0 200.0
        , Rotate (-30.0) 0.0 0.0
        ]
      , SA.rx 250.0
      , SA.ry 100.0
      , SA.fill "none"
      , SA.stroke "blue"
      , SA.strokeWidth 20.0 ] []
    ]

line01 :: forall p i. HTML p i
line01 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example line01 - lines expressed in user coordinates" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    , SE.g [ SA.stroke "green" ]
      [ SE.line [ SA.x1 100.0, SA.y1 300.0, SA.x2 300.0, SA.y2 100.0, SA.strokeWidth 5.0 ] []
      , SE.line [ SA.x1 300.0, SA.y1 300.0, SA.x2 500.0, SA.y2 100.0, SA.strokeWidth 10.0 ] []
      , SE.line [ SA.x1 500.0, SA.y1 300.0, SA.x2 700.0, SA.y2 100.0, SA.strokeWidth 15.0 ] []
      , SE.line [ SA.x1 700.0, SA.y1 300.0, SA.x2 900.0, SA.y2 100.0, SA.strokeWidth 20.0 ] []  
      , SE.line [ SA.x1 900.0, SA.y1 300.0, SA.x2 1100.0, SA.y2 100.0, SA.strokeWidth 25.0 ] []
      ]
    ]


polyline01 :: forall p i. HTML p i
polyline01 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example polyline01 - increasingly larger bars" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    , SE.polyline
      [ SA.fill (none :: Paint)
      , SA.stroke "blue"
      , SA.strokeWidth 10.0
      , SA.points
        [Tuple 50.0 375.0, Tuple 150.0 375.0, Tuple 150.0 325.0, Tuple 250.0 325.0, Tuple 250.0 375.0, Tuple 350.0 375.0, Tuple 350.0 250.0, Tuple 450.0 250.0, Tuple 450.0 375.0, Tuple 550.0 375.0, Tuple 550.0 175.0, Tuple 650.0 175.0, Tuple 650.0 375.0, Tuple 750.0 375.0, Tuple 750.0 100.0, Tuple 850.0 100.0, Tuple 850.0 375.0, Tuple 950.0 375.0, Tuple 950.0 25.0, Tuple 1050.0 25.0, Tuple 1050.0 375.0, Tuple 1150.0 375.0]
      ] []
    ]

polygon01 :: forall p i. HTML p i
polygon01 =
  SE.svg
    [ SA.width (Cm 12.0), SA.height (Cm 4.0), SA.viewBox 0.0 0.0 1200.0 400.0 ]
    [ SE.desc []
      [ HH.text "Example polygon01 - star and hexagon" ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 1198.0, SA.height 398.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    , SE.polygon
      [ SA.fill "red"
      , SA.stroke "blue"
      , SA.strokeWidth 10.0
      , SA.points [Tuple 350.0 75.0, Tuple 379.0 161.0, Tuple 469.0 161.0, Tuple 397.0 215.0, Tuple 423.0 301.0, Tuple 350.0 250.0, Tuple 277.0 301.0, Tuple 303.0 215.0, Tuple 231.0 161.0, Tuple 321.0 161.0] ] []
    , SE.polygon
      [ SA.fill "lime"
      , SA.stroke "blue"
      , SA.strokeWidth 10.0
      , SA.points [Tuple 850.0 75.0, Tuple 958.0 137.5, Tuple 958.0 262.5, Tuple 850.0 325.0, Tuple 742.0 262.6, Tuple 742.0 137.5] ] []
    ]