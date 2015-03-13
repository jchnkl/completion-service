module Completion.Completer
    ( Partial
    , Completion
    , CompletionGraph
    , buildGraph
    , completions
    ) where

import Data.DAWG.Static (DAWG)
import qualified Data.DAWG.Static as Dawg

type Partial = String
type Completion = String

-- alphabet symbols ^= Char, these are the edges/vertices of the graph
-- transition labels ^= (), because this is a frozen (immutable) Dawg
-- node values ^= (), because we're only interested in the edges
type CompletionGraph = DAWG Char () ()

buildGraph :: [String] -> CompletionGraph
buildGraph = Dawg.fromList . map (\s -> (s,()))

completions :: Partial -> CompletionGraph -> [Completion]
completions p = map (p++) . Dawg.keys . Dawg.submap p
