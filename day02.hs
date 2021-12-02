module Main where
import Control.Monad (liftM2)

easy :: [(String, Int)] -> Int
easy = uncurry (*) . foldl f (0,0)
  where f (h,d) ("forward",x) = (h + x, d)
        f (h,d) ("down",x)    = (h, d + x)
        f (h,d) ("up",x)      = (h, d - x)
        f _ _ = undefined

hard :: [(String, Int)] -> Int
hard = g . foldl f (0,0,0)
  where f (h,d,a) ("forward",x) = (h + x, d + a*x, a)
        f (h,d,a) ("down",x)    = (h, d, a + x)
        f (h,d,a) ("up",x)      = (h, d, a - x)
        f _ _ = undefined
        g (h,d,_) = h * d

solve :: String -> String
solve = show . hard . map ((\[x,y] -> (x, read y)) . words) . lines

---------------------- IO -------------------------- 

inFile :: String
inFile = "inputs/day02.txt"

outFile :: String
outFile = "outputs/day02_2.txt"

main :: IO ()
main = readFile inFile >>= writeFile outFile . solve