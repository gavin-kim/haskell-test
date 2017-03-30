-- NOTE: Set is useful to remove all duplicate values in the list
--       Using toList from Set is much faster than using List.nub
--       To use Set, the type of list has to be Ord
let setNub xs = Set.toList $ Set.fromList xs

Set.fromList [2,3,4] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]
True

Set.fromList [1,2,3,4,5] `Set.isProperSubsetOf` Set.fromList [1,2,3,4,5]
False
