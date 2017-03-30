module Shapes (
    Point(..), -- Point(..) exports all the value constructors for Point
    Shape(..), -- the same as Shape(Circle, Rectangle)
    surface,
    nudge,
    baseCircle,
    baseRect
) where


-- NOTE: data is used to define a new data type
-- data (Type: return) = (value constructors: values that this type can have)

-- NOTE: Value constructors are functions that take the arguments and
--       return avalue of some type (like Shape) as a result

-- NOTE: If there is only one value constructor use the same name (Point)
-- NOTE: Shape can be Circle or Rectangle type
--       Circle:    value constructor has 3 Float type arguments
--       Rectalble: value constructor has 4 Float type arguments

-- NOTE: deriving makes the type a part of the Show typeclass
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

-- NOTE: Takes Shape type and return Float
--       We can not write a type declaration of Circle -> Float
--       because Circle is not a type
surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) =
    (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x + a) (y + b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b =
    Rectangle (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)
