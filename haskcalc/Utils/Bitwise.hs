module Utils.Bitwise (
  rippleAdder,
  twoComplement,
  TwoSome(..),
  Register(..)
) where

  data TwoSome = TwoSome { sumBit :: Bool, carryBit :: Bool }
    deriving (Show)
  data Register = Register { value :: [Bool], carryFlag :: Bool  }
    deriving (Show)

  {-|
  XOR Gate function
  -}
  xorGate :: Bool -> Bool -> Bool
  xorGate a b =
    let ab_nand = not(a && b)
        ab_or = a || b
    in ab_nand && ab_or


  twoComplement :: [Bool] -> [Bool]
  twoComplement bools =
    let
      invertedBits = [ not b | b <- bools ]
      size = length bools - 1
      additive = replicate size False ++ [True]
      result = rippleAdder invertedBits additive size Register{value=[], carryFlag=False}
    in value result

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
  each next sum has to wait for the previous carry digit, yielding a O(n)
  algorithm, it's easy to implement.
  -}
  rippleAdder :: [Bool] -> [Bool] -> Int -> Register -> Register
  rippleAdder a b n r
    | n >= 0 =
      let fa = fullAdder (a !! n) (b !! n) (carryFlag r)
      in rippleAdder a b (n - 1) (Register (sumBit fa : value r) (carryBit fa))
    | otherwise = r
