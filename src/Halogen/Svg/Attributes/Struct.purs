module Halogen.Svg.Attributes.Struct where

import Prelude

import Halogen.HTML (AttrName(..), IProp, attr)

xmlns :: forall r i. String -> IProp (xmlns :: String | r) i
xmlns = attr (AttrName "xmlns")

version :: forall r i. String -> IProp (version :: String | r) i
version = attr (AttrName "version")

id :: forall r i. String -> IProp (id :: String | r) i
id = attr (AttrName "id")

--style :: forall r i. String -> IProp (style :: String | r) i
--style = attr (AttrName "style")