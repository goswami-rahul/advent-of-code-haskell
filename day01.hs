module Main where
small = undefined
large = undefined

solve :: String -> String
solve = undefined

--------- all IO below

inFile :: String
inFile = "inputs/day01a.txt"

outFile :: String
outFile = "outputs/day01a.txt"

main :: IO ()
main = readFile inFile >>= writeFile outFile . solve