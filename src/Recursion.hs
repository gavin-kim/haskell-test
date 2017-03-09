-- Recursion

-- 1. Edge conditions
-- 2. Identities (For sum: 0, For multiplication 1)
-- 3. Break apart the parameters of function


max' :: (Ord a) => [a] -> a
max' [] = error "empty list" -- edge condition
max' [x] = x                 -- edge condition
max' (x:xs)                  -- catch-all using pattern match
    | x > maxTail = x        -- return head if head is max
    | otherwise = maxTail    -- return tail otherwise
    where maxTail = max' xs  -- recursion with tail until max' returns x

-- using max function
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list"      -- edge condition
maximum' [x] = x                      -- edge condition
maximum' (x:xs) = max x (maximum' xs) -- catch-all recursion with tail

-- NOTE: Num is not subclass of Ord, so type variable i needs both Num and Ord
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = []                          -- edge condition
    | otherwise = x : replicate' (n - 1) x -- recursion until it returns []


take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n list
    | n <= 0    = [] -- edge condition: if n <= 0
    | null list = [] -- edge condition: if a list is empty
take' n (x:xs)  = x : take' (n - 1) xs -- recursion until n == 0 or xs is []


reverse' :: [a] -> [a]
reverse' [] = []                     -- edge condition
reverse' (x:xs) = reverse' xs ++ [x] -- recursion


repeat' :: a -> [a]
repeat' x = x : repeat' x -- x:(x:(x:repeat x)) infinite


zip' :: [a] -> [b] -> [(a, b)]
zip' list1 list2
    | null list1 = []                   -- edge condition
    | null list2 = []                   -- edge condition
zip' (x:xs) (y:ys) = (x, y): zip' xs ys -- recursion (x1, y1):(x2, y2): ... :[]


elem' :: (Eq a) => a -> [a] -> Bool
elem' t [] = False             -- edge condition
elem' t (x:xs)
    | t == x    = True         -- edge condition
    | otherwise = t `elem'` xs -- recursion


-- Quicksort is considered really cheesy in Haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []    -- edge condition
quicksort (p:list) = -- pivot: x
    let leftSorted = quicksort [x | x <- list, x <= p]
        rightSorted = quicksort [x | x <- list, x > p]
    in leftSorted ++ [p] ++ rightSorted -- merge until  [] ++ [p] ++ []

-- more readable
quicksort (p:list) = -- pivot: x
    let leftSorted = quicksort (filter (<=x) xs) -- lazy run
        rightSorted = quicksort (filter (>x) xs) -- lazy run both take once
    in leftSorted ++ [p] ++ rightSorted -- merge until  [] ++ [p] ++ []
