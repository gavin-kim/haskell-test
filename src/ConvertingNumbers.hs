-- NOTE: Conversion between numerical types in Haskell must be done explicitly

-- 1. Converting from and between Integral types
-- NOTE: Integral types contain non-fractional numbers

-- fromIntegral :: (Num b, Integral a) => a -> b
-- fromInteger :: Num a => Integer-> a
-- toInteger :: (Integral a) => a -> Integer


-- 2. Converting from and between real-fractional types (rational-like types)
-- NOTE: RealFrac types can contain either whole numbers or fractions.
--       Rational
