module Halogen.Svg.Core where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Variant (Variant, inj)
import Halogen.HTML (IProp)
import Halogen.HTML as H
import Halogen.HTML.Core (HTML, Prop(Attribute), Namespace(Namespace), AttrName(AttrName))
import Halogen.VDom (ElemName, VDom(Elem))
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

ns :: Maybe Namespace
ns = Just $ Namespace "http://www.w3.org/2000/svg"

element :: forall p r i. ElemName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i
element = coe (\name props children -> Elem ns name props children)
  where
    coe :: (ElemName -> Array (IProp r i) -> Array (VDom (Array (IProp r i)) p) -> VDom (Array (IProp r i)) p)
        -> ElemName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i
    coe = unsafeCoerce


vattr :: forall v s a r i. AttrName -> (Variant ( s :: a | v) -> String) -> a -> IProp r i
vattr name f a = H.attr name (f (inj (Proxy :: Proxy s) a))