module Exercise02 exposing (isEvenDecoder)

import Json.Decode exposing (Decoder, fail, succeed)


{- Now that we are able to create a decoder which always succeeds we can start
   playing with it.

   The tests will provide the success decoder for you. What you need to do is
   modify the success value that decoder produces. In this case, we don't care
   what actual integer it produces, we only care about knowing if it is even or
   odd.

   We already know how we would do this if we didn't have to bother with these
   decoder things and the function is provided. Your job is to use that function
   and lift it into the world of `Decoder`.

       isEvenDecoder (succeed 4)

   should produce something equivalent to (~=)

       succeed True

   while

       isEvenDecoder (succeed 3) ~= succeed False

   If a failing decoder is passed in, nothing will change.

       isEvenDecoder (fail "foo") ~= fail "foo"
-}


isEvenDecoder : Decoder Int -> Decoder Bool
isEvenDecoder intDecoder =
    fail "Ouch!"


isEven : Int -> Bool
isEven x =
    x % 2 == 0



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise02`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise02`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise02`
-}
