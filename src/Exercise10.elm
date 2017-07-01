module Exercise10 exposing (Reference, referencesDecoder)

import Exercise05 exposing (Id(Id))
import Json.Decode exposing (Decoder, fail)


{- There sure are a lot of different structures in this API:

       "references" : [ { "post-id" : 1 },
                        { "post-id" : 4, "count" : 3 }
                      ],

   Whomever made this bit decided to just omit the "count" field when there was
   only one reference to a post. Luckily, we don't have to duplicate this in our
   application by filling in the `1` when needed.

   A function for constructing the `Reference` has been provided.

   As usual, we need another tool to make something of this. Once again, we want
   to apply a decoder if we have a value, but we want `Nothing` if the field is
   missing. Remember the warning not to use the wrong function from the previous
   exercise?
-}


type alias Reference =
    { postId : Id
    , count : Int
    }


referencesDecoder : Decoder (List Reference)
referencesDecoder =
    fail "This seems like a lot of work."


referenceDecoder : Decoder Reference
referenceDecoder =
    fail "This seems like very slightly less work."


mkReference : Maybe Int -> Int -> Reference
mkReference count postId =
    Reference (Id postId) (count |> Maybe.withDefault 1)



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise10`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise10`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise10`
-}
