module Halogen.Svg.Indexed.Animate where

import Prelude

import Halogen.Svg.Indexed (AriaAttributes, ConditionalProcessingAttributes, CoreAttributes, DocumentElementEventAttributes, GlobalEventAttributes, PresentationAttributes)
import Type.Row (type (+))

type AnimationAttributeTargetAttributes r =
  ( attributeType :: String
  , attributeName :: String
  | r)

type AnimationTimingAttributes r =
  ( begin :: String
  , dur :: String
  , end :: String
  , min :: String
  , max :: String
  , restart :: String
  , repeatCount :: String
  , repeatDur :: String
  , fill :: String
  | r)

type AnimationValueAttributes r =
  ( calcMode :: String
  , values :: String
  , keyTimes :: String
  , keySplines :: String
  , from :: String
  , to :: String
  , by :: String
  | r)

type AnimationAdditionAttributes r =
  ( additive :: String
  , accumulate :: String
  | r)

type SVGanimate =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  AnimationAttributeTargetAttributes +
  AnimationTimingAttributes +
  AnimationValueAttributes +
  AnimationAdditionAttributes +
  ( externalResourcesRequired :: String
  )

type SVGset =
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  AnimationAttributeTargetAttributes +
  AnimationTimingAttributes +
  ( externalResourcesRequired :: String
  , to :: String
  )

type SVGanimateMotion =
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  AnimationTimingAttributes +
  AnimationValueAttributes +
  AnimationAdditionAttributes +
  ( externalResourcesRequired :: String
  , path :: String
  , keyPoints :: String
  , rotate :: String
  , origin :: String
  )

type SVGanimateColor =
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  AnimationAttributeTargetAttributes +
  AnimationTimingAttributes +
  AnimationValueAttributes +
  AnimationAdditionAttributes +
  ( externalResourcesRequired :: String
  )

type SVGanimateTransform =
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  AnimationAttributeTargetAttributes +
  AnimationTimingAttributes +
  AnimationValueAttributes +
  AnimationAdditionAttributes +
  ( externalResourcesRequired :: String
  , type :: String
  )

type SVGmpath =
  AriaAttributes +
  ConditionalProcessingAttributes +
  CoreAttributes +
  GlobalEventAttributes +
  DocumentElementEventAttributes +
  PresentationAttributes +
  ( externalResourcesRequired :: String
  , "href" :: String
  )