{-# LANGUAGE TemplateHaskell #-}

module Completion.Types
    ( Error(..)
    ) where

import Data.Aeson.TH
import Data.Text.Lazy

data Error = Error { errorStatus :: Int
                   , errorMessage :: Text
                   , errorException :: Maybe Text
                   }
    deriving (Read, Show)

$(deriveJSON defaultOptions ''Error)
