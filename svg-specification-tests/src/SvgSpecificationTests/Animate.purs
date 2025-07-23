module SvgSpecificationTests.Animate where

import Prelude

import Halogen.HTML (HTML(..))
import Halogen.HTML as HH
import Halogen.Svg.Attributes (Additive(..), AnimateMotionRotation(..), AttributeType(..), Color(..), Duration(..), Length(..), RepeatCount(..), TimingFill(..), Transform(..), TransformType(..), URL(..), Visibility(..), seconds)
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Attributes.HasClasses (auto)
import Halogen.Svg.Attributes.Path (PathCommand(..))
import Halogen.Svg.Elements as SE
import SvgSpecificationTests.References (ReferenceTest)

referenceTests :: forall p i. Array (ReferenceTest p i)
referenceTests =
  [ { referenceURL: "./references/animate/anim01.svg", actualSVG: anim01 }
  , { referenceURL: "./references/animate/animMotion01.svg", actualSVG: animMotion01 }
  , { referenceURL: "./references/animate/dom01.svg", actualSVG: dom01 }
  ]

anim01 :: forall p i. HTML p i
anim01 =
  SE.svg
    [ SA.width (Cm 8.0) , SA.height (Cm 3.0) , SA.viewBox 0.0 0.0 800.0 300.0
    , SA.xmlns "http://www.w3.org/2000/svg"
    ]
    [ SE.desc [] [ HH.text "Example anim01 - demonstrate animation elements" ]
    , borderRect
    , growingRect
    , SE.g [ SA.transform [ Translate 100.0 100.0 ] ] [ text]
    ]
  where
    borderRect = SE.rect
      [ SA.x 1, SA.y 1, SA.width 798, SA.height 298
      , SA.fill "none", SA.stroke "blue", SA.strokeWidth 2 ]
      []

    growingRect = SE.rect
      [ SA.x 300, SA.y 100, SA.width 300, SA.height 100

      , SA.fill (RGB 255 255 0) ]
      [ animation "x"       (Px 300.0) (Px 0.0)
      , animation "y"       (Px 100.0) (Px 0.0)
      , animation "width"   (Px 300.0) (Px 800.0)
      , animation "height"  (Px 100.0) (Px 300.0)
      ]


    animation attributeName from to =
      SE.animate
        [ SA.attributeName attributeName
        , SA.attributeType AttributeTypeXML
        , SA.begin (seconds 0)
        , SA.dur (seconds 9)
        , SA.fill TimingFillFreeze
        , SA.from from
        , SA.to to
        ] []
    
    text = SE.text
      [ SA.id "TextElement" , SA.x 0.0 , SA.y 0.0
      , SA.fontFamily "Verdana" , SA.fontSize (Px 35.27) , SA.visibility Hidden
      ]
      [ HH.text "It's alive!"
      , SE.set
        [ SA.attributeName "visibility", SA.attributeType AttributeTypeCSS, SA.to Visible
        , SA.begin (seconds 3), SA.dur (seconds 6), SA.fill TimingFillFreeze
        ] []
      , SE.animateMotion
        [ SA.path [ M 0.0 0.0, L 100.0 100.0 ]
        , SA.begin (seconds 3), SA.dur (seconds 6), SA.fill TimingFillFreeze
        ] []
      , SE.animateColor
        [ SA.attributeName "fill", SA.attributeType AttributeTypeCSS
        , SA.from (RGB 0 0 255), SA.to (RGB 128 0 0)
        , SA.begin (seconds 3), SA.dur (seconds 6), SA.fill TimingFillFreeze
        ] []
      , SE.animateTransform
        [ SA.attributeName "transform", SA.attributeType AttributeTypeXML
        , SA.type_ TransformTypeRotate, SA.from (-30.0), SA.to 0.0
        , SA.begin (seconds 3), SA.dur (seconds 6), SA.fill TimingFillFreeze
        ] []
      , SE.animateTransform
        [ SA.attributeName "transform", SA.attributeType AttributeTypeXML
        , SA.type_ TransformTypeScale, SA.from 1.0, SA.to 3.0, SA.additive AdditiveSum
        , SA.begin (seconds 3), SA.dur (seconds 6), SA.fill TimingFillFreeze
        ] []
      ]

animMotion01 :: forall p i. HTML p i
animMotion01 =
  SE.svg
    [ SA.width (Cm 5.0), SA.height (Cm 3.0), SA.viewBox 0.0 0.0 500.0 300.0
    , SA.xmlns "http://www.w3.org/2000/svg"
    ]
    [ SE.desc [] [ HH.text "Example animMotion01 - demonstrate motion animation computations" ]
    , SE.rect
      [ SA.x 1, SA.y 1, SA.width 498, SA.height 298
      , SA.fill "none", SA.stroke "blue", SA.strokeWidth 2
      ] []
    , SE.path
      [ SA.id "path1" , SA.d [ M 100.0 250.0, C 100.0 50.0 400.0 50.0 400.0 250.0 ]
      , SA.fill "none" , SA.stroke "blue" , SA.strokeWidth (Px 7.06)
      ] []
    , circle (Px 100.0) (Px 250.0)
    , circle (Px 250.0) (Px 100.0)
    , circle (Px 400.0) (Px 250.0)
    , SE.path
      [ SA.d [ M (-25.0) (-12.5), L 25.0 (-12.5), L 0.0 (-87.5), Z ]
      , SA.fill "yellow" , SA.stroke "red" , SA.strokeWidth (Px 7.06)
      ]
      [ SE.animateMotion
        [ SA.dur (seconds 6), SA.repeatCount RepeatCountIndefinite, SA.rotate (auto :: AnimateMotionRotation) ]
        [ SE.mpath [ SA.href (URL "#path1") ] [] ]
      ]

    ]
  where
    circle (cx :: Length) (cy :: Length) = SE.circle [ SA.cx cx, SA.cy cy, SA.r (Px 17.64), SA.fill "blue" ] []

dom01 :: forall p i. HTML p i
dom01 =
  SE.svg
    [ SA.width (Cm 4.0), SA.height (Cm 2.0), SA.viewBox 0.0 0.0 400.0 200.0
    , SA.xmlns "http://www.w3.org/2000/svg"
    ]
    [ HH.text embeddedScript
    , SE.rect
      [ SA.x 1, SA.y 1, SA.width 398, SA.height 198
      , SA.fill "none", SA.stroke "blue", SA.strokeWidth 2
      ] []
    , SE.g
      [ SA.transform [ Translate 50.0 150.0] , SA.fill "red", SA.fontSize (Px 7.0) ]
      [ SE.text [ SA.id "TextElement" ] [ HH.text "SVG" ] ]
    ]
  where
    embeddedScript = """
      <script type="application/ecmascript"><![CDATA[
        var timevalue = 0;
        var timer_increment = 50;
        var max_time = 5000;
        var text_element;
        function StartAnimation(evt) {
          text_element = evt.target.ownerDocument.getElementById("TextElement");
          ShowAndGrowElement();
        }
        function ShowAndGrowElement() {
          timevalue = timevalue + timer_increment;
          if (timevalue > max_time)
            return;

          // Scale the text string gradually until it is 20 times larger
          scalefactor = (timevalue * 20.) / max_time;
          text_element.setAttribute("transform", "scale(" + scalefactor + ")");
          // Make the string more opaque
          opacityfactor = timevalue / max_time;
          text_element.setAttribute("opacity", opacityfactor);

          // Call ShowAndGrowElement again <timer_increment> milliseconds later.
          setTimeout("ShowAndGrowElement()", timer_increment)
        }
        window.ShowAndGrowElement = ShowAndGrowElement
      ]]></script>
    """

{-
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="4cm" height="2cm" viewBox="0 0 400 200"
     onload="StartAnimation(evt)" version="1.1"
     xmlns="http://www.w3.org/2000/svg">

  <rect x="1" y="1" width="398" height="198"
        fill="none" stroke="blue" stroke-width="2"/>

  <g transform="translate(50,150)" fill="red" font-size="7">
    <text id="TextElement">SVG</text>
  </g>
</svg>
