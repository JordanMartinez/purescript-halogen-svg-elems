module SvgSpecificationTests.Text where

import Prelude

import Halogen.HTML (HTML(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HA
import Halogen.Svg.Attributes.ContentType (Length(..))
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Elements.Shapes as SE
import Halogen.Svg.Elements.Struct as SE
import Halogen.Svg.Elements.Text as SE
import SvgSpecificationTests.References (ReferenceTest)

referenceTests :: forall p i. Array (ReferenceTest p i)
referenceTests =
  [ { referenceURL: "./references/text/text01.svg" , actualSVG: text01 }
  , { referenceURL: "./references/text/tspan01.svg" , actualSVG: tspan01 }
  , { referenceURL: "./references/text/tspan02.svg" , actualSVG: tspan02 }
  , { referenceURL: "./references/text/tspan04.svg" , actualSVG: tspan04 }
  , { referenceURL: "./references/text/tspan05.svg" , actualSVG: tspan05 }
  , { referenceURL: "./references/text/text-preformatted.svg" , actualSVG: textPreformatted }
  , { referenceURL: "./references/text/text-wrapped.svg" , actualSVG: textWrapped }
  ]


text01 :: forall p i. HTML p i
text01 =
  SE.svg
    [ SA.width (Cm 10.0), SA.height (Cm 3.0), SA.viewBox 0.0 0.0 1000.0 300.0 ]
    [ SE.text
      [ SA.x 250.0, SA.y 180.0, SA.fontFamily "Verdana", SA.fontSize (Px 64.0), SA.fill "blue" ]
      [ HH.text "Hello, out there!" ]
    ]

tspan01 :: forall p i. HTML p i
tspan01 =
  SE.svg
    [ SA.width (Cm 10.0), SA.height (Cm 3.0), SA.viewBox 0.0 0.0 1000.0 300.0 ]
    [ SE.g [ SA.fontFamily "Verdana", SA.fontSize (Px 64.0) ]
      [ SE.text [ SA.x 160.0, SA.y 180.0, SA.fill "blue" ]
        [ HH.text "You are"
        , SE.tspan [ SA.fontWeight SA.FontWeightBold, SA.fill "red" ]
          [ HH.text "not" ]
        , HH.text "a banana." ]
      ]
    ]

tspan02 :: forall p i. HTML p i
tspan02 =
  SE.svg
    [ SA.width (Cm 10.0), SA.height (Cm 3.0), SA.viewBox 0.0 0.0 1000.0 300.0 ]
    [ SE.g [ SA.fontFamily "Verdana", SA.fontSize (Px 64.0) ]
      [ SE.text [ SA.x 100.0, SA.y 180.0, SA.fill "blue" ]
        [ HH.text "But you"
        , SE.tspan [ SA.dx (Em 2.0), SA.dy (-50.0), SA.fontWeight SA.FontWeightBold, SA.fill "red" ]
          [ HH.text " are " ]
        , SE.tspan [ SA.dy 100.0 ]
          [ HH.text "a peach!" ]
        ]
      ]
    ]

tspan04 :: forall p i. HTML p i
tspan04 =
  SE.svg
    [ SA.width (Cm 10.0), SA.height (Cm 3.0), SA.viewBox 0.0 0.0 1000.0 300.0 ]
    [ SE.desc [] 
      [ HH.text "Example tspan04 - The number of rotate values is less than the number of characters in the string." ]
    , SE.text [ SA.fontFamily "Verdana", SA.fontSize (Px 55.0), SA.fill "blue" ]
      [ SE.tspan [ SA.x 250.0, SA.y 150.0, SA.rotate [-30, 0, 30] ]
        [ HH.text "Hello, out there" ]
      ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 998.0, SA.height 298.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    ]

tspan05 :: forall p i. HTML p i
tspan05 =
  SE.svg
    [ SA.width (Cm 10.0), SA.height (Cm 3.0), SA.viewBox 0.0 0.0 500.0 120.0 ]
    [ SE.desc [] 
      [ HH.text "Example tspan05 - propagation of rotation values to nested tspan elements." ]
    , SE.text
      [ SA.fontFamily "Arial, sans-serif"
      , SA.fontSize (Px 32.0)
      , SA.fill "red"
      , SA.x 40.0
      , SA.y 40.0
      , SA.rotate [5, 15, 25, 35, 45, 55]
      ]
      [ HH.text "Not"
      , SE.tspan [ SA.rotate [-10, -20, -30, -40], SA.fill "orange" ]
        [ HH.text "all characters" 
        , SE.tspan [ SA.rotate [70, 60, 50, 40, 30, 20, 10], SA.fill "yellow" ]
          [ HH.text "in"
          , SE.tspan [ SA.id "child3" ]
            [ HH.text "the" ]
          ]
        , SE.tspan
          [ SA.id "child4"
          , SA.rotate [-10]
          , SA.fill "orange"
          , SA.x 40.0
          , SA.y 90.0
          ]
          [ HH.text "text" ]
        ]
      , HH.text "have a"
      , SE.tspan [ SA.id "child5", SA.rotate [-10], SA.fill "blue" ]
        [ HH.text "specified" ]
      , HH.text "rotation"
      ]
    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 498.0, SA.height 118.0, SA.fill "none", SA.stroke "blue", SA.strokeWidth 2.0 ] []
    ]

textPreformatted :: forall p i. HTML p i
textPreformatted =
  SE.svg
    [ SA.width 300.0, SA.height 100.0, SA.viewBox 0.0 0.0 300.0 100.0 ]
    [ SE.text [ SA.x 20.0, SA.y 45.0, HA.style "font: 24px sans-serif;" ]
      [ HH.text "Example of multi-line,"
      , SE.tspan
        [ SA.x 20.0
        , SA.y 75.0
        , HA.style "font: 24px sans-serif;"
        ]
        [ HH.text "pre-formatted text." ]
      ]
    ]

textWrapped :: forall p i. HTML p i
textWrapped =
  SE.svg
    [ SA.width 300.0, SA.height 100.0, SA.viewBox 0.0 0.0 300.0 100.0 ]
    [ SE.text
      [ SA.x 20.0
      , SA.y 45.0
      , HA.style "font: 24px sans-serif; inline-size: 250px;"
      --, SA.width (Px 250.0)
      ]
      [ HH.text "Example of text auto-wrapped." ]
    ]

{-

<svg xmlns="http://www.w3.org/2000/svg"
     width="300" height="100" viewBox="0 0 300 100">

  <text x="20" y="45" style="font: 24px sans-serif; inline-size: 250px;">
    Example of text auto-wrapped.</text>

</svg>