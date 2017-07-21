module Prime1 where

primesBetween :: Int ->  Int -> [Int]
primesBetween m n = filter isPrime [m..n] 

isPrime x = isPrime' x (takeWhile (<=r) primes)
    where
    r = truncate $ sqrt $ fromIntegral x
    isPrime' 1 _  = False
    isPrime' _ [] = True
    isPrime' x (p:ps) | x `mod` p == 0 = False
                      | otherwise      = isPrime' x ps
    
solve ([x]:ps) = [primesBetween m n | [m,n] <- ps]

(x:xs) `minus` (y:ys) | x < y   = x:(xs `minus` (y:ys))
                      | x == y  = xs `minus` ys
                      | x > y   = (x:xs) `minus` ys


multiples n = map (*n) [n..]

primes = 2:([3..] `minus` composites)
    where
    composites =  union [multiples p | p <- primes]

union = foldr merge []

merge (x:xs) ys = x:merge' xs ys
merge' (x:xs) (y:ys) | x < y = x:merge' xs (y:ys)
                     | x ==y = x:merge' xs ys
                     | x > y = y:merge' (x:xs) ys

process = concatMap showSolution . solve . map (map read) . map words . lines
    where
    showSolution ns = (concat [show n ++ "\n" | n <- ns])++"\n" 
