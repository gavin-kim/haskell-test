module Geometry.Cube (
    volume,
    area
) where

-- qualified imports for the exported functions with the same names
import qualified Geometry.Cuboid as Cuboid

volume :: Float -> Float
volume side = Cuboid.volume side side side

area :: Float -> Float
area side = Cuboid.area side side side
