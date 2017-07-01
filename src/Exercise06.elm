module Exercise06 exposing (categoriesDecoder)

import Json.Decode exposing (fail, Decoder)


{- The next bit of JSON we will work on is:

       "categories" : [ "posts", "educational" ],

   Once again, we won't worry about how we get here, we just want to decode the
   value at this location, in this case a list of strings.

   Since strings are primitive constructs, there is a primitive decoder for
   them of type `Decoder String`. But we need a `Decoder (List String)`. Your
   job is to find both the primitive string decoder and a function which will
   apply that decoder to each value in the list.
-}


categoriesDecoder : Decoder (List String)
categoriesDecoder =
    fail "Implement me!"



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise06`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise06`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise06`
-}
