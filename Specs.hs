import Test.Hspec
import Prime1

main = hspec $ do
    describe "primes" $ do
        it "gives an infinite list of prime numbers" $ do
            primes !! 11 `shouldBe` 37
            primes !! 12 `shouldBe` 41

    describe "isPrime" $ do
        it "tells if a number under n is prime" $ do
            filter isPrime [1..20] `shouldBe` [2,3,5,7,11,13,17,19]

    describe "primesBetween" $ do
        it "gives all primes between two numbers" $ do
            primesBetween 1 10  `shouldBe` [2,3,5,7]

    describe "solve" $ do
        it "solves a number of problems" $ do
            solve [[2],[1,10],[3,5]] `shouldBe` [[2,3,5,7],[3,5]]

    describe "process" $ do
        it "process the input and show the output" $ do
            process "2\n1 10\n3 5\n" `shouldBe` "2\n3\n5\n7\n\n3\n5\n\n"
