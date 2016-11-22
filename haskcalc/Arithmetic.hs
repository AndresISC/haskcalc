module Arithmentic (
  add
) where
  import Utils.Bitwise
  import Utils.Strings

  {-|
  Function that adds two binary Strings.
  -}
  add :: String -> String -> String
  add a b =
    let
      s1 = stringToBools a
      s2 = stringToBools b
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
