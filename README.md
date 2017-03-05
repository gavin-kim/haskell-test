# test-haskell

## Haskell Coding style
* Don't leave trailing white space in your code
* Don't use tabs
* Aim to keep lines under 80 characters
* Use the CamelCase variable naming convention
* Don't use explicit braces and semicolons

## Syntax

# Array

        Array can contain only the same type

        ghci> [1,2,3,4] ++ [9,10,11,12]  
        [1,2,3,4,9,10,11,12]  
        ghci> "hello" ++ " " ++ "world"  
        "hello world"

        NOTE: Haskell has to walk through the whole list on the left side of ++

        [1, 2, 3, 4] !! 0   // reference index 0 in the array
        100 : [1, 2, 3, 4]  // add one item at the first in the array

        [3, 4, 2] > [2, 4]  // True

        head------tail------
        (-_-)(  )(  )(  )(  )
        ------init------last

        head [5, 4, 3, 2, 1]    // get the first item
        last [5, 4, 3, 2, 1]    // get the last item

        init [5, 4, 3, 2, 1]    // [5, 4, 3, 2] remove the last item
        tail [5, 4, 3, 2, 1]    // [4, 3, 2, 1] remove the first item
        
