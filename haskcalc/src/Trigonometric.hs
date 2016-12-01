module Trigonometric(
  msen,
  mcos,
  mtan,
  mcot,
  msec,
  mcsc
  )
where
import Arithmetic

{-|
  --Get the value equivalent to radians of the presented degrees
-}
torad :: Double->Double
torad v = ( (v * pi) / 180 )

{-|
  --Recursive to get the value of sinus of the entering radians
-}
sinusr :: Integer->Double->Double->Double
sinusr k x result = 
  if k == 130 then
   ( ((pow (-1) (fromIntegral k) ) * ((pow x ((2*k)+1))) / (fromIntegral (fact ((2*k)+1)))))
  else
   result + (sinusr (k+1) x (((pow (-1) k )*((pow x ((2*k)+1)))/(fromIntegral (fact ((2*k)+1))))))

{-|
  --Returns the "sin" of the entering value, with 'd' to indicate degrees,
   and you can use anything else to make it work with radians
-}
msen :: Double->Char->Double
msen n deg = 
   if(deg == 'd')then
      sinusr 0 (normalize (torad n)) 0 
   else
      sinusr 0 (normalize n) 0 

{-|
  --Returns the "cos" of the entering value, with 'd' to indicate degrees,
   and you can use anything else to make it work with radians
-}
mcos :: Double->Char->Double
mcos n deg = 
   msen  ((pi/2)-n) deg

{-|
  --Returns the "tan" of the entering value, with 'd' to indicate degrees,
   and you can use anything else to make it work with radians
-}
mtan :: Double->Char->Double
mtan n deg = 
   (msen  n deg)/(mcos  n deg)

{-|
  --Returns the "cot" of the entering value, with 'd' to indicate degrees,
   and you can use anything else to make it work with radians
-}
mcot :: Double->Char->Double
mcot n deg = 
   1 / (mtan  n deg)

{-|
  --Returns the "sec" of the entering value, with 'd' to indicate degrees,
   and you can use anything else to make it work with radians
-}
msec :: Double->Char->Double
msec n deg = 
   1 / (mcos  n deg)

{-|
  --Returns the "sec" of the entering value, with 'd' to indicate degrees,
   and you can use anything else to make it work with radians
-}
mcsc :: Double->Char->Double
mcsc n deg = 
   1 / (msen  n deg)

{-|
  --Subtracts pi/2 the necessary times to get a value minor or equals to pi/2
-}
normalize :: Double->Double
normalize a = a - (fromIntegral (truncate (a / (pi*2)))*(pi*2))
