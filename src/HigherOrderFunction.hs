-- Higher order Functions

-- Functions can take functions as parameters and return functions.
-- NOTE: Every function in Haskell officially only takes on parameter.

-- NOTE: Curried functions: functions that accepeted several parameters
-- NOTE: Partially applied functions: Call a function with some of parameters
--       (max 1) returns (a -> Ordering) that is partially applied function

-- NOTE: Infix operator +, -, /, *, ==, /= etc
--       Infix function use (): (==) :: Eq a => a -> a -> Bool
--       (/10) :: Fractional a => a -> Bool

-- max :: (Ord a) => a -> a -> a
-- max :: (Ord a) => a -> (a -> a)

-- max takes a
-- max returns a function(a -> a): It takes a and returns a

multiThree :: (Num a) => a -> a -> a -> a
multiThree x y z = x * y * z

-- ((multiThree 3) 5) 9
-- 1. (multiThree 3): creates a function and returns it.
-- 2. (function 5): create a new function and multiply 5 then return it.
-- 3. (function 9): multiply 9 and return 135.

-- multiThree :: (Num a) => a -> (a -> (a -> a))
--                          ^    {function part}
--                      parameter

-- a -> (a -> (a -> a)): takes a and returns function a -> (a -> a)
-- a -> (a -> a)       : takes a ane returns function a -> a
-- a -> a              : takes a and return a

multiTwoWithNine = multiThree 9 -- returns function a -> (a -> a)
multiWithEighteen = multiTwoWithNine 2 -- returns function a -> a


compareWithHundred :: (Num a, Ord a) => a -> Ordering
-- compareWithHundred x = compare 100 x -- returns a Ordering

compareWithHundred = compare 100
-- returns (a -> Ordering) patially applied function


divideByTen :: (Floating a) => a -> a
divideByTen = (/10) -- infix function

equalsTen :: (Num a, Eq a) => a -> Bool
equalsTen = (==10) -- infix function

isUpperChar :: Char -> Bool
isUpperChar = (`elem` ['A'..'Z'])


-- Functions for parameters.
applyTwice :: (a -> a) -> a -> a -- NOTE: args and returns are the same type
applyTwice func x = func (func x) -- takes a function and applies the function
--                        func x return type a
--                  func takes type a from (func x) then return type a
-- e.g.: applyTwice (3:) [], applyTwice (multiThree 2 2) 9
-- (3:) :: Num a => [a] -> [a]


-- zipWith takes a function and 2 lists as arguments
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = [] -- edge condition
zipWith' _ _ [] = [] -- edge condition
zipWith' func (x:xs) (y:ys) = func x y : zipWith' func xs ys
--                            apply func x y then append returned value(type c)
--                            until the one of lists is empty
-- e.g.: zipWith' (+) [4,2,5,6] [2,6,2,3]
--       zipWith' max [6,3,2,1] [7,3,1,5]


-- flip takes a function and 2 parameters and swap the order of parameters
flip' :: (a -> b -> c) -> b -> a -> c -- func -> b -> a -> c
-- flip' func y x = func x y -- function
flip' f = \x y -> f y x -- lambda

-- zipWith (flip' div) [2,2..] [10,8,6,4,2]
-- zipWith func [2,2..] [10,8,6,4,2]
--         func (x:xs) (y:ys) = func : ziptWith func xs ys
--                              ^- func is (flip' div)

-- map takes a function and list and applies the function to elements
map' :: (a -> b) -> [a] -> [b]
map' _ [] = [] -- edge condition
map' func (x:xs) = func x : map func xs -- apply each element and append it

-- e.g: map (map (^2)) [[1,2], [3,4,5,6], [7,8]]
--      map (replicate 3) [3..6]

-- filter takes a predicate that return True of False) and
-- return a list of elements that are True
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = [] -- edge condition
filter' predicate (x:xs)
    | predicate x = x : filter predicate xs -- True = add
    | otherwise   = filter predicate xs     -- False = skip

-- e.g.: let notNull = not (null x) in filter notNull [[1,2,3],[],[1,2],[]]
--       filter (`elem` [1..100]) [2,4..]


-- NOTE: Even If you map something over a list serveral times and filter
--       the list serveral times, It will only pass over the list once!!!

-- Laziness: It doesn't matter if the filtered list is finite or infinite.
--           The evaluation stops when the first solution is found.
--           You can map over and filter an infinite list.
largestDivisible :: (Integral a) => a
largestDivisible = head (filter predicate [100000,99999..])
    where predicate x = x `mod` 3829 == 0


-- takeWhile takes values while predicate returns True
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []; -- edge condition
takeWhile' predicate (x:xs)
    | predicate x = x : takeWhile' predicate xs -- True, keep going
    | otherwise   = []                          -- False, stop it

-- sum (takeWhile (<10000) (filter odd (map (^2) [1..]))) -- Map
-- sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)]) -- List comprehension

chain :: (Integral a) => a -> [a]
chain 1 = [1] -- edge condition
chain x
    | even x = x : chain (x `div` 2)
    | odd x  = x : chain (x * 3 + 1)


-- check how many lists are in the result
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong list = length list > 15 -- cunstruct predicate function

-- NOTE: Lambda is expression, syntax: (\x y -> x + y)
-- (\xs -> length xs > 15) :: Foldable t => t a -> Bool
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))


-- Get a function that takes a parameter.
listOfFuns = map (*) [0..]
-- map (*)       :: Num a => [a] -> [a -> a]
-- map (*) [0..] :: (Enum a, Num a) => [a -> a]
-- returns a list of functions [(0*), (1*), (2*), (3*), ..]

-- (listOfFuns !! 4) 5,  get index 4 function (4*) and apply 5 to the function

addThree :: (Num a ) => a -> a -> a -> a
-- addThree x y z = x + y + z             -- function
addThree = \x -> \y -> \z -> x + y + z -- lambda
