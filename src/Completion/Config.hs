module Completion.Config where

import Data.Char (ord)
import Network.Wai.Handler.Warp (Port)

defaultPort :: Port
defaultPort = foldr1 (+) $ map ord "completion-service" -- 1880

defaultDictionary :: FilePath
defaultDictionary = "/usr/share/dict/cracklib-small"
