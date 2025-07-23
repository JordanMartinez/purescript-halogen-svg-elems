module Test.Filter where

--import Prelude
--
--import Halogen.HTML (HTML(..))
--import Halogen.HTML as HH
--import Halogen.Svg.Attributes (CSSLength(..), CompositeOperator(..), FilterInput(..))
--import Halogen.Svg.Attributes as SA
--import Halogen.Svg.Attributes.ContentType.Color (Color(..))
--import Halogen.Svg.Attributes.Filter (FilterUnits(..))
--import Halogen.Svg.Attributes.Filter as SA
--import Halogen.Svg.Elements as SE
--import Halogen.Svg.Elements.Filter as SE
--
--filters01 :: HTML w i
--filters01 = SA.svg
--  [ SA.width (Cm 7.5)
--  , SA.height (Cm 5.0)
--  , SA.viewBox 0 0 200 120
--  --, SA.xmlns "http://www.w3.org/2000/svg"
--  --, SA.vers "1.1"
--  ]
--  [ SE.title
--    [ HH.text "Example filters01.svg - introducing filter effects" ]
--  --, SE.
--  --  [ HH.text "An example which combines multiple filter primitives to produce a 3D lighting effect on a graphic consisting of the string \"SVG\" sitting on top of oval filled in red and surrounded by an oval outlined in red." ]
--  , SE.defs
--    [ SE.filter
--      [ SA.id "MyFilter"
--      , SA.filterUnits UserSpaceOnUse
--      , SA.x 0.0
--      , SA.y 0
--      , SA.width 200.0
--      , SA.height 120
--      ]
--      [ SE.feGaussianBlur [ SA.in_ SourceAlpha , SA.stdDeviation 4.0, SA.result "blur" ]
--        []
--      , SE.feOffset
--        [ SA.in_ "blur" , SA.dx 4.0, SA.dy 4.0, SA.result "offsetBlur" ]
--        []
--      , SE.feSpecularLighting
--        [ SA.in_ (FilterPrimitiveReference "blur"), SA.surfaceScale 5.0, SA.specularConstant 0.75
--        , SA.specularExponent 20.0, SA.lightingColor (RGB 187 187 187)
--        , SA.result "specOut" ]
--        [ SE.fePointLight [ SA.x (-5000.0), SA.y (-10000.0), SA.z 20000.0 ] [] ]
--      , SE.feComposite
--        [ SA.in_ "specOut" , SA.in2 SourceAlpha , SA.operator In , SA.k1 0.0 , SA.k2 1.0 , SA.k3 1.0 , SA.k4 0.0 , SA.result "litPaint" ]
--        []
--      , SE.feComposite
--        [ SA.in_ "litPaint", SA.in2 SourceGraphic, SA.operator Arithmetic
--        , SA.k1 0.0, SA.k2 1.0, SA.k3 1.0, SA.k4 0.0, SA.result "litPaint" ]
--        []
--      , SE.feMerge
--        [ SA.in_ "offsetBlur" , SA.in2 "litPaint" ]
--        [ SE.feMergeNode [ SA.in_ "offsetBlur" ] []
--        , SE.feMergeNode [ SA.in_ "litPaint" ] []
--        ]
--      ]
--    , SE.rect [ SA.x 1.0, SA.y 1.0, SA.width 198.0, SA.height 118.0, SA.fill (Named "gray")
--      , SA.stroke (Named "blue") ]
--      []
--    , SE.g [ SA.filter "url(#MyFilter)" ]
--      [ SE.g [ SA.fill (Named "none"), SA.stroke (Named "red"), SA.strokeWidth 10.0, SA.d "M50,90 C0,90 0,30 50,30 L150,30 C200,30 200,90 150,90 z" ] []
--      , SE.path [ SA.fill (Named "red"), SA.d "M60,80 C30,80 30,40 60,40 L140,40 C170,40 170,80 140,80 z" ] []
--      , SE.g [ SA.fill (Named "white"), SA.stroke (Named "black"), SA.fontSize 45.0, SA.fontFamily "Verdana" ]
--        [ SE.text [ SA.x 52.0, SA.y 76.0 ] [ HH.text "SVG" ] ]
--      ]
--    ]
--  ]


{-
<svg width="7.5cm" height="5cm" viewBox="0 0 200 120"
     xmlns="http://www.w3.org/2000/svg" version="1.1">
  <title>Example filters01.svg - introducing filter effects</title>
  <desc>An example which combines multiple filter primitives
        to produce a 3D lighting effect on a graphic consisting
        of the string "SVG" sitting on top of oval filled in red
        and surrounded by an oval outlined in red.</desc>
  <defs>
    <filter id="MyFilter" filterUnits="userSpaceOnUse" x="0" y="0" width="200" height="120">
      <feGaussianBlur in="SourceAlpha" stdDeviation="4" result="blur"/>
      <feOffset in="blur" dx="4" dy="4" result="offsetBlur"/>
      <feSpecularLighting in="blur" surfaceScale="5" specularConstant=".75" 
                          specularExponent="20" lighting-color="#bbbbbb"  
                          result="specOut">
        <fePointLight x="-5000" y="-10000" z="20000"/>
      </feSpecularLighting>
      <feComposite in="specOut" in2="SourceAlpha" operator="in" result="specOut"/>
      <feComposite in="SourceGraphic" in2="specOut" operator="arithmetic" 
                   k1="0" k2="1" k3="1" k4="0" result="litPaint"/>
      <feMerge>
        <feMergeNode in="offsetBlur"/>
        <feMergeNode in="litPaint"/>
      </feMerge>
    </filter>
  </defs>
  <rect x="1" y="1" width="198" height="118" fill="#888888" stroke="blue" />
  <g filter="url(#MyFilter)" >
      <g>
      <path fill="none" stroke="#D90000" stroke-width="10" 
            d="M50,90 C0,90 0,30 50,30 L150,30 C200,30 200,90 150,90 z" />
      <path fill="#D90000" 
            d="M60,80 C30,80 30,40 60,40 L140,40 C170,40 170,80 140,80 z" />
      <g fill="#FFFFFF" stroke="black" font-size="45" font-family="Verdana" >
        <text x="52" y="76">SVG</text>
      </g>
    </g>
  </g>
</svg>
-}