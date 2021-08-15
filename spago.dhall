{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "halogen-svg"
, dependencies =
  [ "aff"
  , "console"
  , "effect"
  , "halogen"
  , "halogen-vdom"
  , "maybe"
  , "newtype"
  , "prelude"
  , "psci-support"
  , "safe-coerce"
  , "strings"
  , "typelevel-prelude"
  , "unsafe-coerce"
  , "web-html"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
