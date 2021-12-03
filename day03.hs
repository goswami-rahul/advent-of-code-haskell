module Main where
import Data.List (transpose)

easy :: [[Int]] -> Int
easy = go 0 0 . transpose
  where go acc bcc []     = acc * bcc
        go acc bcc (x:xs) = go (2*acc + b) (2*bcc + 1-b) xs
          where b = fromEnum $ sum x * 2 > length x

hard :: [[Int]] -> Int
hard xs = go xs 0 id * go xs 0 (1-)
  where go [[]]   acc _   = acc
        go [x:xs] acc flp = go [xs]   (2*acc + x) flp
        go xs     acc flp = go (g xs) (2*acc + b) flp
          where b = flp . fromEnum $ 2 * sum (map head xs) >= length xs
                g = map tail . filter ((==b) . head)

solve :: String -> String
solve = show . hard . (map . map) (read . pure) . lines

---------------------- IO -------------------------- 

inFile :: String
inFile = "inputs/day03.txt"

outFile :: String
outFile = "outputs/day03_2.txt"

main :: IO ()
main = readFile inFile >>= writeFile outFile . solve