module Halogen.Svg.Attributes.ContentType (
  module Halogen.Svg.Attributes.ContentType.Angle,
  module Halogen.Svg.Attributes.ContentType.Anything,
  module Halogen.Svg.Attributes.ContentType.ClockValue,
  module Halogen.Svg.Attributes.ContentType.Color,
  module Halogen.Svg.Attributes.ContentType.Coordinate,
  module Halogen.Svg.Attributes.ContentType.Frequency,
  module Halogen.Svg.Attributes.ContentType.IRI,
  module Halogen.Svg.Attributes.ContentType.Length,
  module Halogen.Svg.Attributes.ContentType.NumberOptionalNumber,
  module Halogen.Svg.Attributes.ContentType.Opacity,
  module Halogen.Svg.Attributes.ContentType.Paint,
  module Halogen.Svg.Attributes.ContentType.Percentage,
  module Halogen.Svg.Attributes.ContentType.Time,
  module Halogen.Svg.Attributes.ContentType.Transform,
  module Halogen.Svg.Attributes.ContentType.URL,
  class IsLengthPercentage, isLengthPercentage,
  class IsLengthPercentageNumber, isLengthPercentageNumber
) where

import Prelude

import Halogen.Svg.Attributes.ContentType.Angle
import Halogen.Svg.Attributes.ContentType.Anything
import Halogen.Svg.Attributes.ContentType.ClockValue
import Halogen.Svg.Attributes.ContentType.Color
import Halogen.Svg.Attributes.ContentType.Coordinate
import Halogen.Svg.Attributes.ContentType.Frequency
import Halogen.Svg.Attributes.ContentType.IRI
import Halogen.Svg.Attributes.ContentType.Length
import Halogen.Svg.Attributes.ContentType.NumberOptionalNumber
import Halogen.Svg.Attributes.ContentType.Opacity
import Halogen.Svg.Attributes.ContentType.Paint
import Halogen.Svg.Attributes.ContentType.Percentage
import Halogen.Svg.Attributes.ContentType.Time
import Halogen.Svg.Attributes.ContentType.Transform
import Halogen.Svg.Attributes.ContentType.URL

class IsLengthPercentage a where
  isLengthPercentage :: a -> String

instance IsLengthPercentage Length where
  isLengthPercentage = show
else instance IsLengthPercentage Percentage where
  isLengthPercentage = printPercentage


class IsLengthPercentageNumber a where
  isLengthPercentageNumber :: a -> String

instance IsLengthPercentageNumber Number where
  isLengthPercentageNumber = show
else instance IsLengthPercentageNumber Int where
  isLengthPercentageNumber = show
else instance IsLengthPercentage a => IsLengthPercentageNumber a where
  isLengthPercentageNumber = isLengthPercentage