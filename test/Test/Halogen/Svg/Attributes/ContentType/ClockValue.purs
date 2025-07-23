module Test.Halogen.Svg.Attributes.ContentType.ClockValue where

import Prelude

import Halogen.Svg.Attributes (ClockValue(..), hours, milliseconds, minutes, seconds)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec :: Spec Unit
spec = do
  describe "Test.Halogen.Svg.Attributes.ContentType.ClockValue" do
    describe "ToClockValue" do
      it "show" do
        show (hours 1) `shouldEqual` "1:00:00.0"
        show (minutes 1) `shouldEqual` "0:01:00.0"
        show (seconds 1) `shouldEqual` "0:00:01.0"
        show (milliseconds 1) `shouldEqual` "0:00:00.001"
