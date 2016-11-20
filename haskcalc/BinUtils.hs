module BinUtils
    (
    ) where

data Register = Register { carry :: Char , register :: String} deriving (Show);
data TwoSome = TwoSome { carryValue :: Char, outputValue :: Char} deriving (Show);

bitAddCarry :: Char -> Char -> TwoSome
bitAddCarry a b
  | a == b = if a == '0'
    then TwoSome '0' '0'
    else TwoSome '1' '0'
  | otherwise = TwoSome '0' '1'

binaryAdd :: String -> String -> [[Char]]
binaryAdd a b = ["Hello", "World"]

-- | Recursive function to be called with strings and value
binAdd :: String -> String -> Int -> Register -> Register
binAdd a b n r
  | n <= length a && n > 0 =
    let sumResult = bitAddCarry (a !! (n -1)) (b !! (n-1))
    in Register (carryValue sumResult) (outputValue sumResult : register r)
  | otherwise = Register 'c' "Hello"
