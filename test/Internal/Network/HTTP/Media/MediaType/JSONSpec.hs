{-|
Module      : Internal.Network.HTTP.Media.MediaType.JSONSpec
Description : Tests for Internal.Network.HTTP.Media.MediaType.JSON
Copyright   : (c) Alex Brandt, 2017
License     : MIT

Tests for "Internal.Network.HTTP.Media.MediaType.JSON".
-}
module Internal.Network.HTTP.Media.MediaType.JSONSpec (main, spec) where

import Data.Aeson (decode, encode)
import Data.Maybe (fromJust)
import Network.HTTP.Media.MediaType (MediaType)
import Test.Hspec (describe, hspec, Spec)
import Test.Hspec.QuickCheck (prop)
import Test.Invariant ((<=>))

import Internal.Network.HTTP.Media.MediaType.Arbitrary ()
import Internal.Network.HTTP.Media.MediaType.JSON ()

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "properties" $
    prop "fromJust . decode . encode == id" (fromJust . decode . encode <=> id :: MediaType -> Bool)
