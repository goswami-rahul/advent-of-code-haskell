module Main where

easy = undefined

hard = easy

solve :: String -> String
solve = undefined

---------------------- IO -------------------------- 

inFile :: String
inFile = undefined

outFile :: String
outFile = undefined

main :: IO ()
main = readFile inFile >>= writeFile outFile . solve