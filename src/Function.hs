-- Syntax in Functions

-- Define separate function bodies for different pattern
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"             -- The most specific ones first
lucky x = "Sorry, you're out of luck, pal!" -- catch-all pattern


fibonacci :: (Integral a) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 2) + fibonacci (n - 1)


first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z


-- error function generates a runtime exception
head' :: (Num a) => [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:y:_) = x + y -- just bind 1st and 2nd item. [1,2,3] is 1:2:3:[]


-- (x:[]) can be [x], and (x:y:[]) can be [x,y]
-- (x:_) is used for binding elements without knowing a length of the list
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: "
               ++ show x ++ " and " ++ show y


length' :: (Num b) => [b] -> b
length' [] = 0                  -- when a length == 0
length' (_:xs) = 1 + length' xs -- when a length > 0


sum' :: (Num a) => [a] -> a
sum' [] = 0               -- when a length == 0
sum' (x:xs) = x + sum' xs -- when a length > 0


-- some@(x:y:_) some has a reference to the whole list
-- You can't use ++ in pattern matches such as (xs ++ [x,y,z]) or (xs ++ [x])
capital :: String -> String
capital "" = "Empty string, woops!"
capital var@(x:_) = "The first letter of " ++ var ++ " is " ++ [x]


-- Guard (If Else)
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height -- arguments
    | bmi <= skinny = "You're underweight" -- The first condition
    | bmi <= normal = "You're supposedly normal"
    | bmi <= fat    = "You're fat"
    | otherwise     = "You're a whale" -- necessary
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0) -- bind use pattern match

-- NOTE: where is used to define names or functions
--       those only exist in the function


initials :: String -> String -> String
initials firstName lastName = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstName -- f is the first char in the String(pattern match)
          (l:_) = lastName  -- l is the first char in the String(pattern match)


-- where binding can also be nested
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs =  [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2 -- define a helper function
              where helper some = "Helper" -- indent point more than outer


-- Can not use bmi name in the (w, h) <- xs part because It's defined before
-- No 'in' in list comprehension because the visibility is already predefined
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]


myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT


-- let vs where
-- let: expressions fairly local in their scope and can't be used across guards
-- where: syntactic constructs used in functions


-- let <binding> in <expression>
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h -- binding
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea     -- expression (result)


-- use semi-colon to bind variables inline
-- (let a = 100; b = 200; c= 300 in a * b * c)

-- let zoot x y z = x * y * z
-- let boot x y z = x * y * z in boot 1 2 3


-- Case expressions

-- case <expression> of pattern -> result
--                      pattern -> result
--                      pattern -> result

head1 :: [a] -> a
head1 [] = error "No head for empty lists!"
head1 (x:_) = x

head2 :: [a] -> a
head2 xs = case xs of
               [] -> error "No head for empty lists!"
               (x:_) -> x


-- Use Case expression
describeList :: [a] -> String
describeList xs = "The list is " ++
                  case xs of
                      [] -> "empty"
                      [x] -> "a singleton list"
                      _ -> "a longer list"

-- User where to define helper function
describeList2 :: [a] -> String
describeList2 xs = "The list is " ++ func xs
    where func [] = "empty"
          func [x] = "a singleton list"
          func _ = "a longer list"
