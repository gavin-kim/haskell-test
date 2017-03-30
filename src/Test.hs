module Test where

eval :: (Fractional a, Integral b) => a -> b -> a
eval x n
    | n <= 0    = 1
    | otherwise = (x ^ n) / fromIntegral (factory n) + eval x (n - 1)

factory :: (Integral a) => a -> a
factory n
    | n <= 1 = 1
    | otherwise = n * factory (n - 1)
