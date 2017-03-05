-- Tuple

-- Tuples can contain a combination of several types. a set of 2 ~ elements

-- In a list, every tuple must match their element's type
tuple = [(1, 'a', "asdf"), (2, 'b', "asdf")]

-- CAUTION: fst, snd, zip only work on pairs
fst tuple -- return its first element
snd tuple -- return its second element
zip [1,2,3,4,5] ["one", "two", "three"]
-- [(1,"one"),(2,"two"),(3,"three")] return a list of pairs that only match

-- function to create a list of 3-tuples
let triangles = [ (a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10] ]
