module Main where

import System.Environment
import System.IO
import System.IO.Error
import Arithmetic

main :: IO ()
main = do
  args <- getArgs
  putStrLn (handler args)


handler :: [String] -> String
handler args
  | null args = "No parameters given."
  | head args == "addThem" = let --addThem
    a = read (args !! 1) :: Int
    b = read (args !! 2) :: Int
    in show (addThem a b)
  | head args == "subtractThem" = let
    a = read (args !! 1) :: Int
    b = read (args !! 2) :: Int
    in show (subtractThem a b)
  | otherwise = "Unknown command"
