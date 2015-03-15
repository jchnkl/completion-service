{-# LANGUAGE OverloadedStrings #-}

module Completion.Service (service) where

import Completion.Completer
import Completion.Config
import Completion.Types
import Control.Applicative
import Data.Text.Lazy (unpack)
import Network.Wai.Handler.Warp (Port)
import Network.Wai.Middleware.Cors
import Web.Scotty

service :: Port -> IO ()
service p = buildGraph . words <$> readFile defaultDictionary >>= runScotty p

runScotty :: Port -> CompletionGraph -> IO ()
runScotty port graph = scotty port $ do
    middleware simpleCors
    get (capture "/complete") $ flip completions graph . firstParam <$> params >>= json
    notFound                  $ json $ Error 400 "service not found" Nothing
    where
    firstParam []        = ""
    firstParam ((x,_):_) = unpack x
