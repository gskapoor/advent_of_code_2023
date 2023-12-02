module Main where
import Data.Char
import Data.List

digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

isPrefix :: String -> String -> Bool
isPrefix [] _ = True
isPrefix _ [] = False
isPrefix (x:xs) (y:ys)
  | x == y = isPrefix xs ys
  | otherwise = False


extract_numbers :: String -> [Int]
extract_numbers [] = []
extract_numbers (x:xs)
  | isDigit x = [digitToInt x] ++ extract_numbers xs
  | otherwise = extract_numbers xs

extract_tens :: [Int] -> Int
extract_tens [] = 0
extract_tens xs = 10 * (head xs) + (last xs)

extract_numbers2 :: String -> [Int]
extract_numbers2 [] = []
extract_numbers2 str
  | isPrefixOf "zero"   str = 0 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "one"    str = 1 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "two"    str = 2 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "three"  str = 3 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "four"   str = 4 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "five"   str = 5 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "six"    str = 6 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "seven"  str = 7 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "eight"  str = 8 : extract_numbers2 (drop 1 str) 
  | isPrefixOf "nine"   str = 9 : extract_numbers2 (drop 1 str) 
  | isDigit  (head str) =  digitToInt (head str) : extract_numbers2 (tail str) 
  | otherwise = extract_numbers2 (tail str)


part2 :: String -> Int
part2 = sum . map ( extract_tens . extract_numbers2 ) . lines

part1 :: String -> Int
part1 = sum . map ( extract_tens . extract_numbers ) . lines




main :: IO ()
main = do
  input_string <- readFile "../input.txt"
  print $ part2 input_string
  print $ part1 input_string
