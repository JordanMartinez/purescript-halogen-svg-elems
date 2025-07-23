module Halogen.Svg.Attributes.Paths where

import Prelude

import Data.String (joinWith)
import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.Path (CommandPositionReference(..), PathCommand)
import Web.HTML.Common (AttrName(..))

class IsPathShape a where
  isPathShape :: a -> String

instance IsPathShape (Array PathCommand) where
  isPathShape = show

instance IsPathShape (Array (CommandPositionReference -> PathCommand)) where
  isPathShape = joinWith " " <<< map (\c -> show (c Abs))

-- the cowards option
instance IsPathShape String where
  isPathShape = identity

d :: forall r i a. IsPathShape a => a -> IProp (d :: String | r) i
d = attr (AttrName "d") <<< isPathShape

pathLength :: forall r i. Number -> IProp (pathLength :: String | r) i
pathLength = attr (AttrName "pathLength") <<< show

