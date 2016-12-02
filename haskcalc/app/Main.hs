module Main where

import System.Environment
import System.IO
import System.IO.Error
import Arithmetic
import Trigonometric

main :: IO ()
main = do
  args <- getArgs
  putStrLn (handler args)

handler :: [String] -> String
handler args
  | null args = "No parameters given."
  | head args == "pow" = let
    a = read (args !! 1) :: Double
    b = read (args !! 2) :: Integer
    in show (pow a b)
  | head args == "fact" = let
    a = read (args !! 1) :: Integer
    in show (fact a)
  | head args == "addThem" = let --addThem
    a = read (args !! 1) :: Int
    b = read (args !! 2) :: Int
    in show (addThem a b)
  | head args == "subtractThem" = let
    a = read (args !! 1) :: Int
    b = read (args !! 2) :: Int
    in show (subtractThem a b)
  | head args == "multiplyThem" = let
    a = read (args !! 1) :: Int
    b = read (args !! 2) :: Int
    in show (multiplyThem a b )
  | head args == "divideThem" = let
    a = read (args !! 1) :: Int
    b = read (args !! 2) :: Int
    in show (divideThem a b)
  |head args == "sin" = let
    n = read (args !! 1) :: Double
    m = read (args !! 2) :: Char
    in show (msen n m)
  |head args == "cos" = let
    n = read (args !! 1) :: Double
    m = read (args !! 2) :: Char
    in show (mcos n m)
  |head args == "tan" = let
    n = read (args !! 1) :: Double
    m = read (args !! 2) :: Char
    in show (mtan n m)
  |head args == "cot" = let
    n = read (args !! 1) :: Double
    m = read (args !! 2) :: Char
    in show (mcot n m)
  |head args == "sec" = let
    n = read (args !! 1) :: Double
    m = read (args !! 2) :: Char
    in show (msec n m)
  |head args == "csc" = let
    n = read (args !! 1) :: Double
    m = read (args !! 2) :: Char
    in show (mcsc n m)
  | otherwise = "Unknown command"
