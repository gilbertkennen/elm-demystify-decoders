module Exercise01 exposing (successDecoder)

import Json.Decode exposing (Decoder, fail)


{- So, you're mystified by JSON decoding in Elm? No worries, let's try and make
   them *click* for you, by going through a set of exercises where you'll be
   gradually creating more and more complex JSON decoders.

   So what _is_ a JSON decoder in Elm, really? Essentially, it is a way to go
   from a raw JavaScript value to an Elm type. This process *can* fail and if it
   does, a `String` message will be produced to hopefully help you out a bit. If
   the decoding doesn't fail, then we produce a value of the type indicated.

   `Decoder Int` produces some `Int` value on success.

   To get comfortable with Decoders, we are going to start by playing with some
   that do not care what the underlying JavaScript value is at all.

   Below, you will find a decoder which *always* fails with a message. We want
   a decoder which always succeeds with a static value.

   JavaScript input:

       var listToDecode = [ "foo", "bar", "baz" ];

   Elm output:

       42

   Poke around in the [documentation][1] a bit to see if you can find the right
   function. It might help to check out `fail` since it is related.

   [1]: http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
-}


successDecoder : Decoder Int
successDecoder =
    fail "I always fail!"



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise01`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise01`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise01`
-}
