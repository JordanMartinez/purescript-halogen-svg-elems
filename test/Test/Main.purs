module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.Spec.Discovery (discover, discoverAndRunSpecs)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)
import Test.Spec.Runner.Node (runSpecAndExitProcess)

main :: Effect Unit
main = discoverAndRunSpecs [consoleReporter] "Test\\.Halogen\\.Svg\\..*"