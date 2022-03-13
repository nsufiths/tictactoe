import Test.HUnit
import Lib 

test1 = TestCase ( do 
                    let field = replicate 3 $ replicate 3 XMark
                    let state = GameState field XPlayer
                    let winner = getWinner state
                    assertEqual "For all X field " (Winner XPlayer) winner
                    )

test2 = TestCase ( do 
                    let field = replicate 3 $ replicate 3 OMark
                    let state = GameState field XPlayer
                    let winner = getWinner state
                    assertEqual "For all O field " (Winner OPlayer) winner
                    )

test3 = TestCase ( do 
                    let field = replicate 3 $ replicate 3 Empty
                    let state = GameState field XPlayer
                    let winner = getWinner state
                    assertEqual "For empty field " Draw winner
                    )


tests = TestList [TestLabel "Test for XWinner" test1, TestLabel "Test for OWinner" test2 , TestLabel "Test for Draw" test3]

main = runTestTT tests

