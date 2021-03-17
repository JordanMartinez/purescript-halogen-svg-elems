{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "halogen-svg"
, dependencies =
  [ "halogen"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
