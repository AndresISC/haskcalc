module Arithmentic (
  addition,
  subtraction,
  f,
  pow
) where
  import Utils.Bitwise
  import Utils.Strings

  {-|
  Function that adds two binary Strings.
  -}
  addition :: String -> String -> String
  addition a b =
    let
      s1 = stringToBools a
      s2 = stringToBools b
      r = _add s1 s2
    in boolsToString (value r)

  {-|
  Function that substracts a from b.
  RESPECT THE ORDER
  -}
  subtraction :: String -> String -> String
  subtraction a b =
    let
      s1 = stringToBools a
      s2 = twoComplement (stringToBools b)
      r = _add s1 s2
    in boolsToString (value r)

    {-|
    Function that adds two binary Strings and returns a 'Register'.
    -}
  _add :: [Bool] -> [Bool] -> Register
  _add a b =
    let
      n = length a - 1
      r = Register { value = [], carryFlag = False }
    in rippleAdder a b n r

  {-|
  Function returns n to power p
  -}
  pow :: Double->Integer->Double
  pow n p = 
     if p == 0 then 
        1
     else
        if p == 1 then
           n
        else
           n * (pow n (p-1))
  {-|
  Function that returns the factorial of a number
  -}
  f :: Integer->Integer
  f n =
     if n == 1 then
        n
     else 
        n * (f (n-1))