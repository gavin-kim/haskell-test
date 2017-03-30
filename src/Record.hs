
-- NOTE: Record syntax: Haskell automatically create functions in this module
--       (firstName, lastName, age, etc...)
--       Person {firstName="Yoonkwan", lastName="Kim", age=32,
--               height=175, phoneNumber="6395714688", flavor="?"}

-- NOTE: Record vs Value Constructor

--       data Vector = Vector Int Int Int these
--       fields are components of a vector

data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
} deriving (Show)
