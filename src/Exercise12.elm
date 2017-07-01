module Exercise12 exposing (Rating(Numeric, Descriptive), ratingsDecoder)

import Json.Decode exposing (Decoder, fail, int, map, string)


{- Keep at it!:

       "ratings" : [ 7, 3, "Great.", 5, "What were you thinking?" ],

   JavaScript arrays are much more lax in what you are allowed to put in them
   than Elm allows. This poses a problem because `list` only takes a single
   decoder, but we need to somehow cram two primitive decoders in.

   Your job is to find a function which will take a bunch of decoders and try
   them all until one works or they all fail.

   Two easy decoders have been provided so you can focus on what's new.
-}


type Rating
    = Numeric Int
    | Descriptive String


ratingsDecoder : Decoder (List Rating)
ratingsDecoder =
    fail "Gotta rate them all."


ratingDecoder : Decoder Rating
ratingDecoder =
    fail "How do I choose between them?"


numericRatingDecoder : Decoder Rating
numericRatingDecoder =
    int |> map Numeric


descriptiveRatingDecoder : Decoder Rating
descriptiveRatingDecoder =
    string |> map Descriptive



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise12`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise12`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise12`
-}
