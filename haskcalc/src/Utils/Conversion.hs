module Utils.Conversion
    (
    binToInt,
    binToSignedInt,
    intToBin,
    signedIntToBin,
    completeBits
    )
  where
    import Utils.Bitwise


    -- TODO: Refactor this constants to be calculed with out own definitions
    bits = 32
    maxUnsigned = (2^bits) -1
    minSigned = (2^bits) / 2
    maxSigned = minSigned - 1

    {-|
    Converts a signed integer to binary
    -}
    signedIntToBin :: Int -> [Bool]
    signedIntToBin num =
      let
        absvalue = abs num
        binStr = intToBin absvalue
      in if num < 0
        then twoComplement binStr
        else binStr


    {-|
    Converts integer to unsigned int
    -}
    intToBin :: Int -> [Bool]
    intToBin number
      | number > maxUnsigned = error "Number is bigger that can be stored"
      | number == 0 = replicate bits False
      | otherwise = 
        let n = abs number in
        completeBits (twoDivision n [])


    {-|
    Handles two division for decimal to integer conversion
    -}
    twoDivision :: Int -> [Bool] -> [Bool]
    twoDivision number storage
      | number == 0 = False : storage
      | number == 1 = True : storage
      | otherwise =
        let
          result = quotRem number 2
          newBool = snd result == 1
          newStorage = newBool : storage
        in twoDivision (fst result) newStorage


    completeBits :: [Bool] -> [Bool]
    completeBits bools =
      let
        difference = bits - length bools
      in if difference == 0 then bools else replicate difference False ++ bools

    {-|
    Converts a binary string to a signed integer
    -}
    binToSignedInt :: [Bool] -> Int
    binToSignedInt bools =
      let
        size = length bools - 1
        in if head bools
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
