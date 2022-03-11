module Lib  where
import Control.Monad.State

data GameState =  GameState {field :: [[Mark]], currentPlayer :: Player } deriving (Eq, Show)
data Player    = XPlayer | OPlayer deriving (Eq, Show)
data Mark      = XMark | OMark | None deriving (Eq, Show)
data Winner    = Draw | Winner Player deriving (Eq, Show)

someFunc :: IO ()
someFunc = putStrLn "someFun!!!!c"

foo:: Int->Int->Int 
foo = (+)



makeTurn':: (Int, Int) -> State GameState GameState
makeTurn' (x, y) = do 
    (GameState field cp) <- get
    let mark = if cp == XPlayer then XMark else OMark
    let row = field !! y 
    let updated = updateByIndex row x mark 
    let newField = updateByIndex field y updated
    let newPlayer = if cp == XPlayer then OPlayer else XPlayer
    put (GameState newField newPlayer)
    get


initialState = GameState (replicate 3 $ replicate 3 None) XPlayer
makeTurn:: (Int, Int) -> GameState
makeTurn xy = fst $ runState (makeTurn' xy) initialState

updateByIndex xs n newElement = take n xs ++ [newElement] ++ drop (n + 1) xs

getWinner :: GameState -> Winner
getWinner (GameState f cp) | any (\row -> all (==XMark) row ) f = Winner XPlayer
                           | any (\row -> all (==OMark) row ) f = Winner OPlayer
                           | otherwise = Draw



fact' :: Integer -> State Integer Integer
-- тип состояния - Integer, тип результата - тоже Integer


fact' 0 = get

fact' n = do
    acc <- get -- получаем аккумулятор
    put (acc * n) -- домножаем его на n и сохраняем
    fact' (n - 1) -- продолжаем вычисление факториала

-- fact :: Integer -> Integer
fact n = fst $ runState (fact' n) 1