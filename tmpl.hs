module Main where
small = undefined
large = undefined

solve :: String -> String
solve = undefined

--------- all IO below

inFile :: String
inFile = "INPUT_FILE_NAME"

outFile :: String
outFile = "OUTPUT_FILE_NAME"

main :: IO ()
main = readFile inFile >>= writeFile outFile . solve