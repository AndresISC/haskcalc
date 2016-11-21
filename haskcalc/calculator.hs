module Main where
<<<<<<< HEAD
--Returns n to power p
pow :: Double->Integer->Double
pow n p = 
   if p == 0 then 
      1
   else
      if p == 1 then
         n
      else
         n * (pow n (p-1))

--Finds a number's factorial
f :: Integer->Integer
f n =
   if n == 1 then
      n
   else 
      n * (f (n-1))

--TODO: Trigonometric functions ( :v I'll do diz 2)

--Get the value equivalent to radians of the presented degrees
torad :: Double->Double
torad v = ( (v * pi) / 180 )

--Recursive to get the value of sinus of the entering radians
sinusr :: Integer->Double->Double->Double
sinusr k x result = 
  if k == 130 then
   ( ((pow (-1) k ) * ((pow x ((2*k)+1))) / (fromIntegral (f ((2*k)+1)))))
  else
   result + (sinusr (k+1) x ( ((pow (-1) k ) * ((pow x ((2*k)+1))) / (fromIntegral (f ((2*k)+1))))))

--Returns the sinus of the entering value, with 'd' to indicate degrees, and everything else to make it work with radians
sinus :: Double->Char->Double
sinus n deg = 
   if(deg == 'd')then
      sinusr 0 (normalize (torad n)) 0 
   else
      sinusr 0 (normalize n) 0 

--Returns the sinus of the entering value, with 'd' to indicate degrees, and everything else to make it work with radians
sinus :: Double->Char->Double
sinus n deg = 
   if(deg == 'd')then
      sinusr 0 (normalize (torad n)) 0 
   else
      sinusr 0 (normalize n) 0 


--Subtracts pi/2 the necessary times to get a value minor or equals to pi/2 :v
normalize :: Double->Double
normalize a = a - (fromIntegral (truncate (a / (pi*2)))*(pi*2))
=======

import           BinUtils

sq :: Float->Float
sq c = c * c

normalize :: Float->Float
normalize a =
   a - (fromIntegral (truncate (a / (3.1415926535897932384626433832795/2)))*(3.1415926535897932384626433832795/2))
>>>>>>> 36d89f5cd636d9a52f2c1535518775aa79197232


--CONCERNING TO BINARY MANIPULATION
--Converts a decimal digit between (-32768,32768) to binary
tobin :: Integer->String
<<<<<<< HEAD
tobin dec = 
   if (abs (dec)) <= 32767 then
      if dec > 0 then
      (complete16bit (absbin dec)) 
   else
    if dec < 0 then
      (twoComplement 0 ((complete16bit (absbin (abs (dec))))) "" 0 )
    else 
=======
tobin decimal =
   if (abs (decimal)) <= 32767 then
      if decimal > 0 then
    show 0 ++ (complete16bit (getAbsBin decimal))
   else
    if decimal < 0 then
      show 1 ++ (complete16bit (getAbsBin (abs (decimal))))
    else
>>>>>>> 36d89f5cd636d9a52f2c1535518775aa79197232
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

--Completes a binary digit of a length minor to 16 digits putting zeros in the lacking digits.
complete16bit :: String->String
<<<<<<< HEAD
complete16bit bnd = 
   if (length (bnd)) < 16 then 
      (complete16bit (show 0 ++ bnd)) 
   else 
      bnd

--Gets the binary absolute value
absbin :: Integer->String
absbin decimal = 
   if decimal < 2 then 
      (show decimal) 
   else 
      (absbin (toInteger (truncate ((fromIntegral(decimal))/2)))) ++ show (mod decimal 2)
=======
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
>>>>>>> 36d89f5cd636d9a52f2c1535518775aa79197232

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
