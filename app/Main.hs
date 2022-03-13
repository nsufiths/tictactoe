module Main where
import System.Random
import Lib

getTurnFirst::IO (Int, Int)
getTurnFirst = do 
    x <- randomRIO (0,3)
    y <- randomRIO (0,3)
    return (x,y)

getTurnSecond::IO (Int, Int)
getTurnSecond = do 
    x <- randomRIO (0,3)
    y <- randomRIO (0,3)
    return (x,y)

main :: IO ()
main = print $ play
    

