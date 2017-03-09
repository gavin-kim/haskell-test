-- Type and Typeclasses
-- '::' is read as "has type of"
-- NOTE: All types are written in capital case

-- NOTE: Num is a numeric typeclass.
-- Int, Integer, Float, Double are memebers of Num
-- Num - Integal  - Int, Integer
--     - Floating - Float, Double

-- Int      4 bytes range
-- Integer  really big number
-- Float    a real floating point with single precision
-- Double   a real floating point with double precision
-- Bool     a boolean type
-- Char     a character
-- [Char]   a string
-- ()       a tuple type which can only have a single value

:t 'a'      -- 'a' :: Char
:t True     -- True :: Bool
:t "Hello!" -- "Hello!" :: [Char]

-- Type declaration for functions
addThree :: Int -> Int -> Int -> Int -- get 3 int types and return a int type
addThree x y z = x + y + z

-- Functions that have type variables are called polymorphic functions.
head :: [a] -> a -- a is a type variable. It's like generic type in Java

-- ==, +, -, *, / etc are infix functions, to examine its type use ()

-- (Eq a) is class constraint.
-- Eq is a typeclass and It takes a value whose type is a member of Eq
:t (==)
(==) :: (Eq a) => a -> a -> Bool

-- Ord is for types that can be compared
-- Ord covers all the standard comparing functions such as >, <, >= and <=
:t (>)
(>) :: (Ord a) => a -> a -> Bool

-- Ordering is a type that can be LT, GT or EQ.
:t compare
compare :: Ord a => a -> a -> Ordering

-- Members of Show can be presented as strings.
-- show function deals with Show typeclass
show True -- "True"

-- Read takes a string and returns a type which is a member of Read
-- read function returns a generic type.
read :: (Read a) => String -> a

read "[1,2,3]"           -- Error: It doesn't know what type to return
read "[1,2,3]" :: [Char] -- [1,2,3,4] : explicit a type annotation
read "(3, 'a')" :: (Int, Char)

-- Enum members are sequentially orderd types
:t succ
succ :: Enum a => a -> a

-- Bounded members have an upper and a lower bound
minBound :: Int         -- -2147483648
maxBound :: Char        -- '\1114111'
maxBound :: (Bool, Int) -- (True, 2146483647) All tuples are member of Bounded
minBound :: Bounded a => a -- they are polymophic


-- from Integer function get Int or Integer type and turns it into Num
fromInteger :: (Num b, Integral a) => a -> b
