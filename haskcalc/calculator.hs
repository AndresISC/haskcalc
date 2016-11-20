module Main where
pow :: Float->Integer->Float
pow n p = 
   if p == 0 then 
      1
   else
      if p == 1 then
         n
      else
         n * (pow n (p-1))

--TODO: Trigonometric functions ( :v I'll do diz 2)


--Subtracts pi/2 the necessary times to get a value minor or equals to pi/2 :v
normalize :: Float->Float
normalize a = a - (fromIntegral (truncate (a / (3.1415926535897932384626433832795/2)))*(3.1415926535897932384626433832795/2))


--CONCERNING TO BINARY MANIPULATION

--Converts a decimal digit between (-32768,32768) to binary
tobin :: Integer->String
tobin dec = 
   if (abs (dec)) <= 32767 then
      if dec > 0 then
      (complete16bit (getAbsBin dec)) 
   else
    if dec < 0 then
      (twoComplement 0 ((complete16bit (getAbsBin (abs (dec))))) "" 0 )
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

--Completes a binary digit of a length minor to 16 digits putting zeros in the lacking digits.
complete16bit :: String->String
complete16bit bnd = 
   if (length (bnd)) < 16 then 
      (complete16bit (show 0 ++ bnd)) 
   else 
      bnd
--Gets the binary absolute value
getAbsBin :: Integer->String
getAbsBin decimal = 
   if decimal < 2 then 
      (show decimal) 
   else 
      (getAbsBin (toInteger (truncate ((fromIntegral(decimal))/2)))) ++ show (mod decimal 2)

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