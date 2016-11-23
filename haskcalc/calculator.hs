{-module Main where 
--Returns n to power p


--CONCERNING TO BINARY MANIPULATION
--Converts a decimal digit between (-32768,32768) to binary
tobin :: Integer->String
tobin dec =
   if (abs (dec)) <= 65535 then
      if dec > 0 then
    show 0 ++ (complete16bit (getAbsBin dec))
   else
    if dec < 0 then
      show 1 ++ (complete16bit (getAbsBin (abs (dec))))
    else
      (show 0)
   else
      "Error, only numbers between (-32767,32767)"

--Finds the negative number of a binary positive representing it in two's complement.
twoComplement :: Integer->String->String->Integer->String
twoComplement pointer binString t2c flag = 
   if ((length (binString)-fromIntegral(pointer)) == 0 ) then --Iguales
      t2c
   else
      if flag == 0 then
      (
      if (binString !! ((length (binString)-1)-(fromIntegral(pointer)))) == '0' then
         (twoComplement (pointer+1) binString t2c 0 )++"0"
      else
         (twoComplement (pointer+1) binString t2c 1 )++"1"
      )
      else
      (
      if (binString !! ((length (binString)-1)-(fromIntegral(pointer)))) == '1' then
         (twoComplement (pointer+1) binString t2c 1 )++"0"
      else
         (twoComplement (pointer+1) binString t2c 1 )++"1"
      )

--Gets the binary absolute value
absbin :: Integer->String
absbin decimal = 
   if decimal < 2 then 
      (show decimal) 
   else 
      (absbin (toInteger (truncate ((fromIntegral(decimal))/2)))) ++ show (mod decimal 2)
complete16bit binarydig =
   if (length (binarydig)) < 31 then
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
-}

