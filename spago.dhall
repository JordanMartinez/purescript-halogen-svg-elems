{ name = "halogen-svg"
, dependencies =
  [ "aff"
  , "arrays"
  , "effect"
  , "foldable-traversable"
  , "halogen"
  , "halogen-hooks"
  , "maybe"
  , "newtype"
  , "prelude"
  , "safe-coerce"
  , "strings"
  , "tuples"
  , "typelevel-prelude"
  , "web-dom"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
