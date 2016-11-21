module BinUtils where

{-|
Data type that describes a 'Register'
The register it's a "memory" for storing Integers, this memory has 2 slots:
  __carry__ and register, carry contains a carry bit for the given Integer,
  in case overflow or underflow ocurred, we know.
On the other hand, __register__ stores the number that has been added.
-}
data Register = Register { carry :: Char , register :: String} deriving (Show);

{-|
Data type that describes a 'TwoSome'
Here, a _TwoSome_ it's a datatype that stores two characters that simulate
  two bits.
This datatype contains to slots: __carryBit__ and __outBit__.
This datatype is used for adding two bits, therefore, __carryBit__ is
  storing the carry bit, and __outBit__ stores the adding of the two
  bits.
-}
data TwoSome = TwoSome { carryBit :: Char, outBit :: Char} deriving (Show);


-- | This function adds two bits and returns a 'TwoSome'
bitAddCarry :: Char -> Char -> TwoSome
bitAddCarry a b
  | a == b = if a == '0'
    then TwoSome '0' '0'
    else TwoSome '1' '0'
  | otherwise = TwoSome '0' '1'


-- | Function that adds two binary strings of n size
binaryAdd :: String -> String -> Register
binaryAdd a b = _binAdd a b (length a - 1) (Register '0' "")

{-|
Recursive function to be called with strings and value

This function is supposed to be called only internally by it's normal
  definition called 'binaryAdd'.
The parameters handled here are:

  * __a__ : First binary String
  * __b__ : Second binary String
  * __n__ : Initial number, normally beign the length of the first binary String
  this assumes both Strings are of the same length, thus we're adding same-size
  numbers.
  * __r__ : Register, a initial, empty register to begin the calculation

  In the function, __sumD__ sums the bits on the Binary Strings,
  while __sumC__ sums the carry bits of the actual number and the carry of the
  result of the sum of the __sumD__

-}
_binAdd :: String -> String -> Int -> Register -> Register
_binAdd a b n r
  | n < length a && n >= 0 =
      let sumD = bitAddCarry (a !! n) (b !! n)
          sumC = bitAddCarry (outBit sumD) (carry r)
          sumT = bitAddCarry (carryBit sumD) (carryBit sumC)
      in _binAdd a b (n - 1) (Register (outBit sumT) (outBit sumC : register r))
  | otherwise = r
