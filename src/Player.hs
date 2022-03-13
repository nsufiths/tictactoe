module Player  where
import Lib 
import System.Random

class Strategy a where 
    chooseField::a->GameState->IO (Int, Int)

data DummyPlayer = DummyPlayer String 

instance Strategy DummyPlayer where 
    chooseField p (GameState f XPlayer) = return $ if f !! 0 !! 0 == Empty then (0,0) else if  f !! 0 !! 1 == Empty then (1,0) else (2,0)
    chooseField p (GameState f OPlayer) = return $ if f !! 1 !! 0 == Empty then (0,1) else if  f !! 1 !! 1 == Empty then (1,1) else (2,1)

data RandomPlayer = RandomPlayer String 

instance Strategy RandomPlayer where 
    chooseField p _ = do 
        x <- randomRIO (0, 3) 
        y <- randomRIO (0, 3)
        return (x, y)