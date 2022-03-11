module Main where

import Lib

test:: IO Int
test =  putStrLn "aza" >> return 100500

-- (>>) :: Monad m => m a -> m b -> m b
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b

main :: IO ()
main = print $ makeTurn (1,1)
