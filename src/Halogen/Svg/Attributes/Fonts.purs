module Halogen.Svg.Attributes.Fonts where

import Prelude

import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.ContentType (class IsLengthPercentage, isLengthPercentage)
import Web.HTML.Common (AttrName(..))

data GenericFontFamily
  = Serif
  | SansSerif
  | Monospace
  | Cursive
  | Fantasy

derive instance Eq GenericFontFamily

instance Show GenericFontFamily where
  show = case _ of
    Serif -> "serif"
    SansSerif -> "sans-serif"
    Monospace -> "monospace"
    Cursive -> "cursive"
    Fantasy -> "fantasy"


data AbsoluteFontSize
  = XXSmall
  | XSmall
  | Small
  | Medium
  | Large
  | XLarge
  | XXLarge

derive instance Eq AbsoluteFontSize

instance Show AbsoluteFontSize where
  show = case _ of
    XXSmall -> "XXSmall"
    XSmall -> "XSmall"
    Small -> "Small"
    Medium -> "Medium"
    Large -> "Large"
    XLarge -> "XLarge"
    XXLarge -> "XXLarge"


data RelativeFontSize
  = Smaller
  | Larger

derive instance Eq RelativeFontSize

instance Show RelativeFontSize where
  show = case _ of
    Smaller -> "smaller"
    Larger -> "larger"

class IsFontSize a where
  isFontSize :: a -> String

instance IsFontSize AbsoluteFontSize where
  isFontSize = show
else instance IsFontSize RelativeFontSize where
  isFontSize = show
else instance IsLengthPercentage a => IsFontSize a where
  isFontSize = isLengthPercentage




class IsFontFamily a where
  isFontFamily :: a -> String

instance IsFontFamily String where
  isFontFamily = identity

instance IsFontFamily GenericFontFamily where
  isFontFamily = show

instance IsFontFamily a => IsFontFamily (Array a) where
  isFontFamily = joinWith ", " <<< map isFontFamily

instance (IsFontFamily a, IsFontFamily b) => IsFontFamily (Tuple a b) where
  isFontFamily (Tuple a b) = isFontFamily a <> ", " <> isFontFamily b


data FontWeight
  = FontWeightNormal
  | FontWeightBold
  | FontWeightBolder
  | FontWeightNumber Int

derive instance eqFontWeight :: Eq FontWeight

instance showFontWeight :: Show FontWeight where
  show = case _ of
    FontWeightNormal -> "normal"
    FontWeightBold -> "bold"
    FontWeightBolder -> "bolder"
    FontWeightNumber n -> show n

class IsFontWeight a where
  isFontWeight :: a -> String

instance IsFontWeight FontWeight where
  isFontWeight = show

instance IsFontWeight Int where
  isFontWeight = show

instance IsFontWeight Number where
  isFontWeight = show



fontFamily :: forall a r i. IsFontFamily a => a -> IProp ("font-family" :: String | r) i
fontFamily = attr (AttrName "font-family") <<< isFontFamily

fontSize :: forall a r i. IsFontSize a => a -> IProp ("font-size" :: String | r) i
fontSize = attr (AttrName "font-size") <<< isFontSize

fontWeight :: forall a r i. IsFontWeight a => a -> IProp ("font-weight" :: String | r) i
fontWeight = attr (AttrName "font-weight") <<< isFontWeight
