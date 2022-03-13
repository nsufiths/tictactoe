module Player  where
import Lib 

class Strategy a where 
    chooseField::a->GameState->(Int, Int)

data DummyPlayer = DummyPlayer String 

instance Strategy DummyPlayer where 
    chooseField p (GameState f XPlayer) =  if f !! 0 !! 0 == Empty then (0,0) else if  f !! 0 !! 1 == Empty then (1,0) else (2,0)
    chooseField p (GameState f OPlayer) =  if f !! 1 !! 0 == Empty then (0,1) else if  f !! 1 !! 1 == Empty then (1,1) else (2,1)

data RandomPlayer = SmartPlayer String 

instance Strategy RandomPlayer where 
    chooseField p _ = undefined