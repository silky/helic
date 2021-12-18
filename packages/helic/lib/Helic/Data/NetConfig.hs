{-# options_haddock prune #-}
-- |NetConfig Data Type, Internal
module Helic.Data.NetConfig where

import Helic.Data.Host (Host)

newtype Timeout =
  Timeout { unTimeout :: Int }
  deriving stock (Eq, Show, Generic)
  deriving newtype (Num, Real, Enum, Integral, Ord)

defaultJson ''Timeout

data NetConfig =
  NetConfig {
    port :: Maybe Int,
    timeout :: Maybe Timeout,
    hosts :: Maybe [Host]
  }
  deriving stock (Eq, Show, Generic)
  deriving anyclass (Default)

defaultJson ''NetConfig
