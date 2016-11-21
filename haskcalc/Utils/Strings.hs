module Utils.Strings where

  {-|
  Function to convert any character into a boolean.

  This obviates that a character 0 it's False, and anything greater or lower,
  it's True (only in numeric ranges).

  Any other character, a null character, or [a-zA-Z] will be considered False

  -}
  charToBool :: Char -> Bool
  charToBool c
    | c == '0' = False
    | c > '0' && c <= '9' = True
    | otherwise = False

  {-|
  Converts a Bool to a char
  -}
  boolToChar :: Bool -> Char
  boolToChar b
    | not b = '0'
    | otherwise = '1'

  {-|
  Converts a binary string to a boolean list
  -}
  stringToBools :: String -> [Bool]
  stringToBools bits = [ r |  bit <- bits, let r = charToBool bit]

  {-|
  Converts a bool list to a binary String
  -}
  boolsToString :: [Bool] -> String
  boolsToString bools = [ c | bool <- bools, let c = boolToChar bool ]
