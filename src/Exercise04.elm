module Exercise04 exposing (Color(Red, Green, Blue), colorDecoder)

import Json.Decode exposing (Decoder, fail)


{- Transforming values is great and all, but sometimes we might want to reject
   a value as invalid. This is often the case when we are trying to produce a
   union type from something like a `String`.

   This has two steps.

   First, the helper function below takes a string and produces a decoder which
   makes a `Color` on success. The acceptable strings are "red", "green", and
   "blue". Any other string should produce a failure. You have already seen
   or used everything you need to write this function.

       colorDecoderFromString "red" ~= succeed Red

       colorDecoderFromString "foo" ~= fail "foo is not a recognized color."

   Second, we want to find something like `map`, but different. We want to use
   a function of `String -> Decoder Color` (our helper function) and make a
   function of `Decoder String -> Decoder Color`.

       colorDecoder (succeed "blue") ~= succeed Blue

       colorDecoder (succeed "bar") ~= fail "bar is not a recognized color."

       colorDecoder (fail "something") ~= fail "something"
-}


colorDecoder : Decoder String -> Decoder Color
colorDecoder stringDecoder =
    fail "tum tum"


type Color
    = Red
    | Green
    | Blue


colorDecoderFromString : String -> Decoder Color
colorDecoderFromString colorString =
    fail "tummmmm"



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise04`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise04`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise04`
-}
