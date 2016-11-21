module Arithmentic where
import           BinUtils as BU

{-|
Converts a binary string to a boolean list
-}
_stringToBools :: String -> [Bool]
_stringToBools bits = [ r |  bit <- bits, let r = BU.charToBool bit]

{-|
Converts a bool list to a binary String
-}
_boolsToString :: [Bool] -> String
_boolsToString bools = [ c | bool <- bools, let c = BU.boolToChar bool ]

add :: String -> String -> Register
add a b =
  let
    bin_a = _stringToBools a
    bin_b = _stringToBools b
    n = length bin_a - 1
    r = Register [] False
  in BU._rippleAdder bin_a bin_b n r
