-- List

-- List can contain only the same type

[1,2,3,4] ++ [9,10,11,12]  -- [1,2,3,4,9,10,11,12]
"hello" ++ " " ++ "world"  -- "hello world"

-- NOTE: Haskell has to walk through the whole list on the left side of ++

[1, 2, 3, 4] !! 0   -- reference index 0 in the list
100 : [1, 2, 3, 4]  -- add one item at the first in the list

[3, 4, 2] > [2, 4]  -- True

-- {head}{-----tail-----}
-- (-__-)(    )(   )(   )
-- {-----init-----}{last}

head [5, 4, 3, 2, 1] -- get the first item
last [5, 4, 3, 2, 1] -- get the last item

init [5, 4, 3, 2, 1] -- [5, 4, 3, 2] remove the last item
tail [5, 4, 3, 2, 1] -- [4, 3, 2, 1] remove the first item

null []     -- check if it's empty
length []   -- get a length of the list
reverse []  -- get reverse list
take 5 []   -- get 5 items from index 0
drop 10 []  -- get items after dropping 10 items from index 0
maximum []  -- max item
minimum []  -- min item
sum []      -- total
product []  -- multiply all items
4 `elem` [] -- 4 exists in the list?

[1..20]     -- [1,2,3,4......19,20]
['a'..'z']  -- "abcdefghijklmnopqrstuvwxyz"
[3,6..20]   -- [3,6,9,12,15,18]
[20,19..1]  -- Caution: [20..1] doesn't work

take 24 [13,26..]       -- get 24 items from index 0 using unlimited list
take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1]
repeat 5                -- [5,5,5,5,5......]
replicate 3 10          -- [10,10,10]

-- [output, input, filter]
[ x * 2 | x <- [1..10]]            -- [2,4,6,8,10,12,14,16,18,20]
[ x * 2 | x <- [1..10], x*2 >= 12] -- [12,14,16,18,20]
[ x | x <- [1,2,3], y <- [4,5]]    -- always create 3 * 2 length list

[ x * y | x <- [1,2,3], y <- [2,3,4], x < 2, y > 2] -- [3,4]
-- [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
-- [1 | _ <- list] // _ means we will never use a value from the list

let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
[ [ x | x <- xs, even x ] | xs <- xxs] -- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
