module Exercise14 exposing (postDecoder)

import Exercise05 exposing (Id, idDecoder)
import Exercise06 exposing (categoriesDecoder)
import Exercise07 exposing (tagsDecoder)
import Exercise08 exposing (Report, reportsDecoder)
import Exercise09 exposing (Author, authorsDecoder)
import Exercise10 exposing (Reference, referencesDecoder)
import Exercise11 exposing (Votes, votesDecoder)
import Exercise12 exposing (Rating, ratingsDecoder)
import Exercise13 exposing (Reply, repliesDecoder)
import Json.Decode exposing (Decoder, fail, map2)


{- Now let's bring it all together. By working from the inside-out, we were able
   to focus on smaller parts of the whole.

   Unfortunately, we have nine decoders and `Json.Decode` only goes up to
   `map8`. Yes, there are hacky ways to make bigger `map` functions, but we should
   go for something a bit more elegant. The function we need is `andMap` and since
   it isn't part of the core library, I have provided an implementation (it is more
   verbose than necessary so it is clearer what is happening).

   Here it is in action:

       succeed (+)
           |> andMap (succeed 2)
           |> andMap (succeed 3)

   Is equivalent to:

       succeed 5

   We put a function in as a value (in this case `Decode (Int -> Int -> Int)`)
   and with each invocation of `andMap` we partially apply the value, so it
   becomes `Decode (Int -> Int)` and then `Decode Int`. This allows us to use
   functions with an arbitrary number of parameters.

   You now have all the tools you need to finish this.
-}


type alias Post =
    { id : Id
    , categories : List String
    , tags : List ( String, Int )
    , reports : List Report
    , authors : List Author
    , references : List Reference
    , scores : Votes
    , ratings : List Rating
    , replies : List Reply
    }


andMap : Decoder a -> Decoder (a -> b) -> Decoder b
andMap argumentDecoder functionDecoder =
    map2 (\x f -> f x)
        argumentDecoder
        functionDecoder


postDecoder : Decoder Post
postDecoder =
    fail "So... very... close..."



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise12`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise12`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise12`
-}
