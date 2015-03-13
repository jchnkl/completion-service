module Completion.Config where

import Network.Wai.Handler.Warp (Port)

defaultPort :: Port
defaultPort = 8008

defaultDictionary :: FilePath
defaultDictionary = "/usr/share/dict/cracklib-small"
