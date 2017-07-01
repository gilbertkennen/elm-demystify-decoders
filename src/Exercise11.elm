module Exercise11 exposing (Votes, votesDecoder)

import Json.Decode exposing (Decoder, fail)


{- Getting close:

       "scores" : [ 12, 57 ],

   We have an array, but there are always two integer values in this array, upvotes, and downvotes, in that order.

   We *could* decode the whole list and then do some fancy pattern matching and such to get those out of there, but there has to be (and there is) a better way.

   The new decoding function is going to look a lot like `field`, but instead of `String` keys, we have an array, so that means indices.
-}


type alias Votes =
    { upVotes : Int
    , downVotes : Int
    }


votesDecoder : Decoder Votes
votesDecoder =
    fail "User opinions don't matter!"



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise11`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise11`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise11`
-}
