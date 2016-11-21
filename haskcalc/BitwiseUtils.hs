module BitwiseUtils (
  charToBool,
  boolToChar,
  rippleAdder,
  TwoSome(sumBit, carryBit),
  Register(value, carryFlag)
) where

data TwoSome = TwoSome { sumBit :: Bool, carryBit :: Bool } deriving (Show);
data Register = Register { value :: [Bool], carryFlag :: Bool  } deriving (Show);

{-|
Function to convert any character into a boolean.

This obviates that a character 0 it's False, and anything greater or lower, it's
True (only in numeric ranges).

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
XOR Gate function
-}
xorGate :: Bool -> Bool -> Bool
xorGate a b =
  let ab_nand = not(a && b)
      ab_or = a || b
  in ab_nand && ab_or

{-|
Function that simulates the behaviour of a half-adder in electronics
-}
halfAdder :: Bool -> Bool -> TwoSome
halfAdder a b =
  let ab_xor = xorGate a b
      ab_and = a && b
  in TwoSome ab_xor ab_and

{-|
Function that simulates a full-adder circuit
-}
fullAdder :: Bool -> Bool -> Bool -> TwoSome
fullAdder a b cin =
  let
    ha1 = halfAdder a b
    ha2 = halfAdder (sumBit ha1) cin
  in TwoSome (sumBit ha2) (carryBit ha1 || carryBit ha2)

{-|
Function that simulates addition on circuits using a ripple-adder.

Albeit this method is slow, because it has to iterate through every digit, and
each next sum has to wait for the previous carry digit, yielding a O(n) algorithm,
it's easy to implement.
-}
rippleAdder :: [Bool] -> [Bool] -> Int -> Register -> Register
rippleAdder a b n r
  | n >= 0 =
    let fa = fullAdder (a !! n) (b !! n) (carryFlag r)
    in rippleAdder a b (n - 1) (Register (sumBit fa : value r) (carryBit fa))
  | otherwise = r
