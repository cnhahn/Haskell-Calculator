{- | CSE 130: Intro to Haskell Assignment.
     Do not change the skeleton code!

     You may only replace the `error "TBD:..."` parts.

     For this assignment, you may use any library function on integers
     but only the following library functions on lists:

     length
     (++)
     (==)

 -}

{-

Cited helpfull source matterial for clearity:

 -- Used resources from http://learnyouhaskell.com/chapters.
 -- Used resources from https://www.schoolofhaskell.com
 -- Used resources form https://en.wikibooks.org/wiki/Haskell/Control_structures
 -- Used resources from the chapters 1, 2, 4 as suggested on piazza. 
 -- Also got help form TA's in section and group disscussion.

-}

module Hw1 where

import Prelude  hiding (replicate, sum, reverse)


-- | Sum the elements of a list
--
-- >>> sumList [1, 2, 3, 4]
-- 10
--
-- >>> sumList [1, -2, 3, 5]
-- 7
--
-- >>> sumList [1, 3, 5, 7, 9, 11]
-- 36

sumList :: [Int] -> Int

--sumList xs = error "TBD:sumList"
sumList [] = 0
sumList (h:xs) = h + sumList xs
--sumList xs 
--	| [] = 0
--	| (x:ms) = x + sumList ms 
 

-- | `digitsOfInt n` should return `[]` if `n` is not positive,
--    and otherwise returns the list of digits of `n` in the
--    order in which they appear in `n`.
--
-- >>> digitsOfInt 3124
-- [3, 1, 2, 4]
--
-- >>> digitsOfInt 352663
-- [3, 5, 2, 6, 6, 3]

digitsOfInt :: Int -> [Int]
--digitsOfInt n = error "TBD:digitsOfInt"
digitsOfInt 0 = []
--digitsOfInt n = n:(digitsOfInt n)
digitsOfInt n = digitsOfInt (div n 10) ++ [mod n 10]

-- | `digits n` retruns the list of digits of `n`
--
-- >>> digits 31243
-- [3,1,2,4,3]
--
-- digits (-23422)
-- [2, 3, 4, 2, 2]

digits :: Int -> [Int]
digits n = digitsOfInt (abs n)


-- | From http://mathworld.wolfram.com/AdditivePersistence.html
--   Consider the process of taking a number, adding its digits,
--   then adding the digits of the number derived from it, etc.,
--   until the remaining number has only one digit.
--   The number of additions required to obtain a single digit
--   from a number n is called the additive persistence of n,
--   and the digit obtained is called the digital root of n.
--   For example, the sequence obtained from the starting number
--   9876 is (9876, 30, 3), so 9876 has
--   an additive persistence of 2 and
--   a digital root of 3.
--
-- NOTE: assume additivePersistence & digitalRoot are only called with positive numbers

-- >>> additivePersistence 9876
-- 2

additivePersistence :: Int -> Int
--additivePersistence n = error "TBD"
additivePersistence n = if n < 10 then 0 else additivePersistence(sumList(digits(n))) + 1 


-- | digitalRoot n is the digit obtained at the end of the sequence
--   computing the additivePersistence
--
-- >>> digitalRoot 9876
-- 3
digitalRoot :: Int -> Int
--digitalRoot n = error "TBD"
digitalRoot n = if n < 10 then n else digitalRoot(sumList(digits(n)))


-- | listReverse [x1,x2,...,xn] returns [xn,...,x2,x1]
--
-- >>> listReverse []
-- []
--
-- >>> listReverse [1,2,3,4]
-- [4,3,2,1]
--
-- >>> listReverse ["i", "want", "to", "ride", "my", "bicycle"]
-- ["bicycle", "my", "ride", "to", "want", "i"]

listReverse :: [a] -> [a]
--listReverse xs = error "TBD"
listReverse [] = []
listReverse (h:xs) = listReverse xs ++ [h] 


-- | In Haskell, a `String` is a simply a list of `Char`, that is:
--
-- >>> ['h', 'a', 's', 'k', 'e', 'l', 'l']
-- "haskell"
--
-- >>> palindrome "malayalam"
-- True
--
-- >>> palindrome "myxomatosis"
-- False

palindrome :: String -> Bool
--palindrome w = error "TBD"
palindrome [] = False 
--palindrome [_] = False
palindrome w = w == listReverse w
