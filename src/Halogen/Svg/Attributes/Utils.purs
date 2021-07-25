module Halogen.Svg.Attributes.Utils
  ( printArray
  ) where

import Prelude
import Data.String (joinWith)

-- A helper function. Only used in other modules in Halogen.Svg.Attributes
printArray :: forall a. Show a => Array a -> String
printArray xs = joinWith "," (show <$> xs)
