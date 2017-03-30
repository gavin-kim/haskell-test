-- All the functions that Data.List exports become available in the global
-- by Default Prelude module exports some functions from Data.List
import Data.List                -- import a module
import Data.List (nub, sort)    -- import specific functions
import Data.List hiding (nub)   -- import all except num function
import qualified Data.List      -- to use duplicated function (Data.Map.filter)
import qualified Data.List as List -- we can use functions like List.filter

-- For GHCI :m + Data.List Data.Map

-- NOTE: Lazy computation
--       In foldl, The accumulator isn't atually updated as the folding happens
--       The accumulator makes a promise(thunk) that it will compute its value
--       when asked to actually produce the result.
--       This happens for every intermediate accumulator and promises(thunks)

-- NOTE: foldl' and foldl1' are strict versions and dont use lazy computation.
--       they actually compute the intermediate values instead of filling up
--       stack with promices(thunks).

-- Maybe type can either be Just something or Nothing.
-- find :: (a -> Bool) -> [a] -> Maybe a


-- NOTE: any and all
-- any (==4) [2,3,4,5,6]
-- True
-- all (>4) [6,9,10]
-- True


-- NOTE: \\ delete elements that match from the left list
--[1..10] \\ [2,5,9]
--[1,3,4,6,7,8,10]


-- NOTE: nub returns a list whose all element is unique
-- nub [1,1,1,2,2,3,3]
-- [1,2,3]


-- NOTE: union is like set add elements only unique
-- [1..7] `union` [5..10]
-- [1,2,3,4,5,6,7,8,9,10]


-- NOTE: intersect returns duplicated elements between 2 lists
-- [1,2,3] intersect [3,4,5]
-- [3]


-- NOTE: insert regards the list is sorted
-- insert 4 [3,5,1,2,8,2]
-- [3,4,5,1,2,8,2]


-- NOTE: group returns group lists that consist of adjacent and equal elements
-- group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
-- [[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]


-- NOTE: nubBy, deleteBy, unionBy, intersectBy, groupBy
--       use function to check equality (e.g. nub (==))


-- NOTE: sortBy, insertBy, maximumBy, minimumBy
--       Ordering type have a value of LT, EQ or GQ
-- sortBy :: (a -> a -> Ordering) -> [a] -> [a]
-- sortBy (compare `on` length) list
-- (compare `on` length) is (\x y -> length x `compare` length y)

-- NOTE: on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
-- f `on` g = \x y -> f (g x) (g y)

-- f = (b -> b -> c)
-- g = (a -> b)
-- ((a -> b) -> (a -> b) -> c)

-- groupBy ((==) `on` (> 0)) someList
-- groupBy (\x y -> (x > 0) == (y > 0))
