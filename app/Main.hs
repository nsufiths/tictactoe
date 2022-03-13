module Main where
import Lib
import System.Random
import System.IO.Unsafe

test:: Int 
test  = unsafePerformIO $ randomRIO (0, 300)

main :: IO ()
main = print test

