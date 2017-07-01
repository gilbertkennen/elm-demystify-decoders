module Exercise05 exposing (Id(Id), idDecoder)

import Json.Decode exposing (fail, map, Decoder)


{- Now we are going to shift gears and start actually thinking about the
   structure we want to decode. The remaining exercises will build all of the
   parts needed to decode a rather nasty bit of JSON. You can see it in the file
   `sample.json`.

   It's usually best to break up decoding into smaller jobs, so let's look at
   our first bit:

       "id" : 5,

   In our application, it has been decided that an id needs to be type-safe, so
   we will need to use a constructor (provided below) to ensure this.

   There are several decoders which are 'primitive'. At some point they will be
   put up next to some JavaScript value and they will try to turn it into an Elm
   value.

   For now, we won't worry about *how* we get to the value in the "id" field.
   Instead, we will concentrate on what we would do if we got there. In this
   case, we want a decoder which will do the following:

       decodeString idDecoder "5" == Ok 5

       decodeString idDecoder "\"foo\"" == Err <some error string>

   `decodeString` is *not* a decoder, it is just one way that we can use a
   decoder to turn some JavaScript value (in this case a JSON string) into an
   Elm value.

   We already know how to turn an `Int` into an `Id` and we have `map` to lift
   it into the world of `Decoder`, we just need a way of making a `Decoder Int`.
   Go check the module docs, you shouldn't have to go down very far.
-}


idDecoder : Decoder Id
idDecoder =
    (fail "Implement me!")
        |> map Id


type Id
    = Id Int



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise05`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise05`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise05`
-}
