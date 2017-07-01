module Exercise03 exposing (userDecoder)

import Json.Decode exposing (Decoder, fail)


{- Great! Now we can transform the success value of a decoder.

   This one is going to be somewhat similar, but now we have two decoders which
   we want to combine into one.

   We have our function which could do the job if we weren't working with
   decoders and we want to lift this up into the world of `Decoder`.

       userDecoder (succeed 2) (succeed "Marge") ~= succeed (mkUser 2 "Marge")

   This time a failure for either input (or both) should also fail.

        userDecoder (succeed 2) (fail "foo") ~= fail "foo"

   If you are confused by how `mkUser` works, check out the guide entry on
   [type aliases][1]

   [1]: https://guide.elm-lang.org/types/type_aliases.html
-}


userDecoder : Decoder Int -> Decoder String -> Decoder User
userDecoder idDecoder nameDecoder =
    fail "This is escalating quickly!"


type alias User =
    { id : Int
    , name : String
    }


mkUser : Int -> String -> User
mkUser id name =
    User id name



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise03`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise03`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise03`
-}
