module Exercise07 exposing (tagsDecoder)

import Json.Decode exposing (Decoder, fail)


{- In this exercise, we look at this bit of JSON:

       "tags" : { "great" : 5,
                  "elm" : 25,
                  "belgium" : 12,
                  "profanity" : 12
                },

   Once again focusing just on the value (we will get around to applying these
   at the end) we have an object with fields and integers. We know that these
   fields are going to vary, so what has been decided is we want to get a
   `List (String, Int)` out of it.

   JSON field names are always strings, a function that does such a thing will have that built-in. Such a function wouldn't necessarily know what the values are, so it probably needs a decoder (in this case `int`) to work.

   You are tasked with finding such a function.
-}


tagsDecoder : Decoder (List ( String, Int ))
tagsDecoder =
    fail "I'd rather succeed, really."



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise07`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise07`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise07`
-}
