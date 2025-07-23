module Halogen.Svg.Attributes.Render where

import Prelude

import Halogen.HTML.Properties (IProp(..), attr)
import Halogen.Svg.Attributes.HasClasses (class HasDefault, default)
import Web.HTML.Common (AttrName(..))

data Visibility = Visible | Hidden | Collapse | Inherit

instance HasDefault Visibility where
  default = Visible

instance Show Visibility where
  show = case _ of
    Visible -> "visible"
    Hidden -> "hidden"
    Collapse -> "collapse"
    Inherit -> "inherit"

data Display
  = DisplayInline 
  | DisplayBlock 
  | DisplayListItem
  | DisplayInlineBlock 
  | DisplayTable 
  | DisplayInlineTable 
  | DisplayTableRowGroup 
  | DisplayTableHeaderGroup 
  | DisplayTableFooterGroup 
  | DisplayTableRow 
  | DisplayTableColumnGroup 
  | DisplayTableColumn 
  | DisplayTableCell 
  | DisplayTableCaption 
  | DisplayNone 
  | DisplayInherit

instance HasDefault Display where
  default = DisplayInline

instance Show Display where
  show = case _ of
    DisplayInline -> "inline"
    DisplayBlock -> "block"
    DisplayListItem -> "list-item"
    DisplayInlineBlock -> "inline-block"
    DisplayTable -> "table"
    DisplayInlineTable -> "inline-table"
    DisplayTableRowGroup -> "table-row-group"
    DisplayTableHeaderGroup -> "table-header-group"
    DisplayTableFooterGroup -> "table-footer-group"
    DisplayTableRow -> "table-row"
    DisplayTableColumnGroup -> "table-column-group"
    DisplayTableColumn -> "table-column"
    DisplayTableCell -> "table-cell"
    DisplayTableCaption -> "table-caption"
    DisplayNone -> "none"
    DisplayInherit -> "inherit"


visibility :: forall r i. Visibility -> IProp (visibility :: String | r) i
visibility = attr (AttrName "visibility") <<< show

display :: forall r i. Display -> IProp (display :: String | r) i
display = attr (AttrName "display") <<< show

opacity :: forall r i. Number -> IProp (opacity :: String | r) i
opacity = attr (AttrName "opacity") <<< show
