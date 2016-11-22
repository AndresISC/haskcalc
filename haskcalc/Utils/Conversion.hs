module Conversion
    (
    binToInt,
    binToSignedInt
    )
  where
    import Utils.Bitwise

    {-|
    Converts a signed integer to binary
    -}
    -- signedIntToBin :: Int -> [Bool]
    -- signedIntToBin num =
    --   let
    --     absvalue = abs num
    --     binStr = intToBin num
    --   in if num < 0
    --     then twoComplement binStr
    --     else binStr

    {-|
    Converts a binary string to a signed integer
    -}
    binToSignedInt :: [Bool] -> Int
    binToSignedInt bools =
      let
        size = length bools - 1
        in if head bools && bools !! size
          then let tc = twoComplement bools
            in if tc == bools
              then binToInt bools
              else binToInt tc * (- 1)
          else binToInt bools


    {-|
    Converts a binary list to an Integer (unsigned)
    -}
    binToInt :: [Bool] -> Int
    binToInt bools =
      let
        reversed = reverse bools
        maxPow = length bools - 1
      in _binToInt reversed maxPow

    {-|
    Converts a binary number to an Integer (unsigned)
    -}
    _binToInt :: [Bool] -> Int -> Int
    _binToInt bools place
      | place >= 0 = if bools !! place then (2^place) + _binToInt bools (place - 1) else 0 + _binToInt bools (place - 1)
      | otherwise = 0
