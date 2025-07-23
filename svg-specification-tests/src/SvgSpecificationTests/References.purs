module SvgSpecificationTests.References where

import Prelude

import Data.FunctorWithIndex (mapWithIndex)
import Halogen.HTML (HTML(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties (href)
import Halogen.HTML.Properties as HP

type ReferenceTest p i =
  { referenceURL :: String
  , actualSVG :: HTML p i
  }

referenceTestToTableRow :: forall p i.Int -> ReferenceTest p i -> HTML p i
referenceTestToTableRow i { referenceURL, actualSVG } =
  HH.tr_
    [ HH.td_ [ HH.text $ show i ]
    , HH.td_
      [ HH.img [ HP.src referenceURL ]
      ]
    , HH.td_ [ actualSVG ]
    ]

referenceTable :: forall p i. String -> Array (ReferenceTest p i) -> HTML p i
referenceTable referenceName referenceTests =
  HH.p_
    [ HH.h2_ [ HH.text referenceName ]
    ,  HH.table_
        [ HH.thead_
          [ HH.tr_
            [ HH.th_ [ HH.text "ID" ]
            , HH.th_ [ HH.text "Reference" ]
            , HH.th_ [ HH.text "Actual" ]
            ]
          ]
        , HH.tbody_ (mapWithIndex referenceTestToTableRow referenceTests)
        ]
    ]