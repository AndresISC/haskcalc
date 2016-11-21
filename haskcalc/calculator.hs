module Main where

import BinUtils

sq :: Float->Float
sq c = c * c

normalize :: Float->Float
normalize a =
   a - (fromIntegral (truncate (a / (3.1415926535897932384626433832795/2)))*(3.1415926535897932384626433832795/2))

tobin :: Integer->String
tobin decimal =
   if (abs (decimal)) <= 32767 then
      if decimal > 0 then
    show 0 ++ (complete16bit (getAbsBin decimal))
   else
    if decimal < 0 then
      show 1 ++ (complete16bit (getAbsBin (abs (decimal))))
    else
      (show 0)
   else
      "Error, only numbers between (-32768,32768)"

complete16bit :: String->String
complete16bit binarydig =
   if (length (binarydig)) < 15 then
      (complete16bit (show 0 ++ binarydig))
   else
      binarydig

getAbsBin :: Integer->String
getAbsBin decimal =
   if decimal < 2 then
      (show decimal)
   else
      (getAbsBin (toInteger (truncate ((fromIntegral(decimal))/2)))) ++ show (mod decimal 2)

compbin :: String->String
compbin cadena = if (length cadena) < 16 then (compbin (show 0 ++ cadena)) else cadena

--TODO: To decimal from binary (I'll do this)
--Trigonometric functions ( :v I'll do diz 2)

suma :: Float->Float->Float
suma a b = a + b

rest :: Float->Float->Float
rest a b = a - b

mult :: Float->Float->Float
mult a b = a * b

divs :: Float->Float->Float
divs a b = a / b

main =  do
         a<- readLn :: IO Float
         b<- readLn :: IO Float
         let s = suma a b
         let r = rest a b
         let m = mult a b
         let d = divs a b
         print s
         print r
         print m
         print d
