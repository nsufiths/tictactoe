import Test.HUnit
import Lib 

test1 = TestCase (assertEqual "azazazaz upalo" 8 (foo 3 5))

tests = TestList [TestLabel "MY MEGA TEST" test1]

main = runTestTT tests

