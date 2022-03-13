module Lib  where
import Control.Monad.State

data GameState =  GameState {field :: [[Mark]], currentPlayer :: Player } deriving (Eq, Show)
data Player    = XPlayer | OPlayer deriving (Eq, Show)
data Mark      = XMark | OMark | Empty deriving (Eq, Show)
data Winner    = None | Draw | Winner Player deriving (Eq, Show)

initialState = GameState (replicate 3 $ replicate 3 Empty) XPlayer

getCoords::GameState->(Int, Int)
getCoords (GameState f XPlayer) =  if f !! 0 !! 0 == Empty then (0,0) else if  f !! 0 !! 1 == Empty then (1,0) else (2,0)
getCoords (GameState _ OPlayer) = (0,1)

gamePlay:: State GameState Winner
gamePlay = do 
    st <- get
    let winner = getWinner st
    if winner /= None then return winner else do
        let coords = getCoords st
        putMark coords
        let newPayer = if currentPlayer st == XPlayer then OPlayer else XPlayer
        st <- get
        put (st {currentPlayer = newPayer})
        gamePlay


putMark::(Int, Int) -> State GameState Winner
putMark (x, y) = do 
    (GameState field cp) <- get
    let mark = if cp == XPlayer then XMark else OMark
    let row = field !! y 
    let updated = if row !! x == Empty then updateByIndex row x mark else row 
    let newField = updateByIndex field y updated
    put (GameState newField cp)
    return None


updateByIndex xs n newElement = take n xs ++ [newElement] ++ drop (n + 1) xs

getWinner :: GameState -> Winner
getWinner (GameState f cp) | any (\row -> all (==XMark) row ) f = Winner XPlayer
                           | any (\row -> all (==OMark) row ) f = Winner OPlayer
                           | any (==Empty) (concat f) = None
                           | otherwise = Draw

play:: Winner
play = evalState gamePlay initialState
