module Halogen.Svg.Elements.Filter where

import Prelude

import Halogen.HTML (ElemName(..), Node)
import Halogen.Svg.Core (element)
import Halogen.Svg.Indexed.Filter as I

filter :: forall p i. Node I.SVGfilter p i
filter = element (ElemName "filter")

feBlend :: forall p i. Node I.SVGfeBlend p i
feBlend = element (ElemName "feBlend")

feColorMatrix :: forall p i. Node I.SVGfeColorMatrix p i
feColorMatrix = element (ElemName "feColorMatrix")

feComponentTransfer :: forall p i. Node I.SVGfeComponentTransfer p i
feComponentTransfer = element (ElemName "feComponentTransfer")

feComposite :: forall p i. Node I.SVGfeComposite p i
feComposite = element (ElemName "feComposite")

feConvolveMatrix :: forall p i. Node I.SVGfeConvolveMatrix p i
feConvolveMatrix = element (ElemName "feConvolveMatrix")

feDiffuseLighting :: forall p i. Node I.SVGfeDiffuseLighting p i
feDiffuseLighting = element (ElemName "feDiffuseLighting")

feDisplacementMap :: forall p i. Node I.SVGfeDisplacementMap p i
feDisplacementMap = element (ElemName "feDisplacementMap")

feDropShadow :: forall p i. Node I.SVGfeDropShadow p i
feDropShadow = element (ElemName "feDropShadow")

feFlood :: forall p i. Node I.SVGfeFlood p i
feFlood = element (ElemName "feFlood")

feGaussianBlur :: forall p i. Node I.SVGfeGaussianBlur p i
feGaussianBlur = element (ElemName "feGaussianBlur")

feImage :: forall p i. Node I.SVGfeImage p i
feImage = element (ElemName "feImage")

feMerge :: forall p i. Node I.SVGfeMerge p i
feMerge = element (ElemName "feMerge")

feMergeNode :: forall p i. Node I.SVGfeMergeNode p i
feMergeNode = element (ElemName "feMergeNode")

feMorphology :: forall p i. Node I.SVGfeMorphology p i
feMorphology = element (ElemName "feMorphology")

feOffset :: forall p i. Node I.SVGfeOffset p i
feOffset = element (ElemName "feOffset")

feSpecularLighting :: forall p i. Node I.SVGfeSpecularLighting p i
feSpecularLighting = element (ElemName "feSpecularLighting")

feTile :: forall p i. Node I.SVGfeTile p i
feTile = element (ElemName "feTile")

feTurbulence :: forall p i. Node I.SVGfeTurbulence p i
feTurbulence = element (ElemName "feTurbulence")


{-
Filter primitives
9.1Overview
9.2Common filter primitive attributes
9.3Filter primitive tree
9.4Filter primitive subregion
9.5Filter primitive feBlend
9.6Filter primitive feColorMatrix
9.7Filter primitive feComponentTransfer
9.7.1Transfer function feFuncR
9.7.2Transfer function feFuncG
9.7.3Transfer function feFuncB
9.7.4Transfer function feFuncA
9.8Filter primitive feComposite
9.9Filter primitive feConvolveMatrix
9.10Filter primitive feDiffuseLighting
9.11Filter primitive feDisplacementMap
9.12Filter primitive feDropShadow
9.13Filter primitive feFlood
9.13.1The flood-color property
9.13.2The flood-opacity property
9.14Filter primitive feGaussianBlur
9.15Filter primitive feImage
9.16Filter primitive feMerge
9.16.1Merge node feMergeNode
9.17Filter primitive feMorphology
9.18Filter primitive feOffset
9.19Filter primitive feSpecularLighting
9.20Filter primitive feTile
9.21Filter primitive feTurbulence