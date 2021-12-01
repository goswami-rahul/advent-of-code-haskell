module Main where

easy :: [Int] -> Int 
easy = length . filter (<0) . (zipWith (-) <*> tail)

hard :: [Int] -> Int
hard = easy . (zipWith3 (((+) . ) . (+)) <*> tail <*> tail . tail)

solve :: String -> String
solve = show . hard . map read . lines

---------------------- IO -------------------------- 

inFile :: String
inFile = "inputs/day01_2.txt"

outFile :: String
outFile = "outputs/day01_2.txt"

main :: IO ()
main = readFile inFile >>= writeFile outFile . solve