module Halogen.Svg.Core
  ( ns
  , element
  , attr
  ) where
-- Like Halogen.HTML.Core

import Prelude
import Data.Maybe (Maybe(..))
import Halogen.HTML.Core as H
import Halogen.VDom (ElemName, VDom(Elem))
import Unsafe.Coerce (unsafeCoerce)

ns :: Maybe H.Namespace
ns = Just $ H.Namespace "http://www.w3.org/2000/svg"

element :: forall p i.
  ElemName -> Array (H.Prop i) -> Array (H.HTML p i) -> H.HTML p i
element = coe (\name props children -> Elem ns name props children)
  where
    coe ::  (ElemName -> Array (H.Prop i) -> Array (VDom (Array (H.Prop i)) p) ->
            VDom (Array (H.Prop i)) p) -> ElemName -> Array (H.Prop i) ->
            Array (H.HTML p i) -> H.HTML p i
    coe = unsafeCoerce
{- The type signature of `coe` is a little involved. The core coercion is from
      VDom (Array (H.Prop i)) p
   to
      H.HTML p i
 -}

attr :: forall i. H.AttrName -> String -> H.Prop i
attr (H.AttrName name) = H.Attribute Nothing name
