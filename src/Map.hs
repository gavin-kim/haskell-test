phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")]


-- NOTE: return Maybe data type to avoid runtime error
findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
--findKey key [] = Nothing
--findKey key ((k,v):xs) = if key == k
--                             then Just v
--                             else findKey key xs

-- NOTE: It's usually better to use folds for standard list recursion pattern
findKey key = foldl (\acc (k,v) -> if key == k then Just v else acc) Nothing

-- NOTE: fromList return Map type. Duplicate keys will be removed
Map.fromList

-- NOTE: fromListWith uses a function to resolve duplicate keys
Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
fromList [(2,100),(3,29),(4,22)]

Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
fromList [(2,108),(3,62),(4,37)]

-- NOTE: insertWith
Map.insertWith (+) 3 100 $ Map.fromList [(3,4),(5,103),(6,339)]
fromList [(3,104),(5,103),(6,339)]

-- NOTE: Map.null checks an empty list
