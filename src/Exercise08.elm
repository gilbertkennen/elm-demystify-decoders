module Exercise08 exposing (Report(TosViolation, Custom), reportsDecoder)

import Json.Decode exposing (Decoder, andThen, fail, list, succeed)


{- Next up:

       "reports" : [ { "reason": "tos-violation" },
                     { "reason": "custom", "text" : "Think of the children!" }
                   ],

   We already know how to decode lists, but the objects in this list are a bit
   different. For simplicity of the example, there are only two report types and
   one type has a different shape.

   For this, you need to choose a decoder based on the value in a particular
   field. Luckily we already learned how to choose different decoders based on
   an input (back before we were working with an actual JavaScript value).

   The new trick here is how to get the string at "reason" in the first place.
   Let's think about what we need to know to perform such an action. We need to
   know the name of the field, a `String`, and we need to decode the value in
   that field, so a `Decoder String` and if things are successful, we expect
   that the new decoder will produces a `String`, so the result should have type
   `Decoder String`. Once you have that, you can use that string to choose the
   decoder for the shape of data that you have.

   That is a lot, but you will find the problem broken up into smaller steps
   below (often a good idea).

   `reportsDecoder` is fine as it is, you shouldn't need to change it.

   `reportDecoder` needs to get the "reason" string and figure out how to pass
   it to `reportDecoderFromString`

   `reportDecoderFromString` needs to choose which of he two remaining decoders
   to use based on the input string. It should fail if the "report" string is
   unrecognized.

   `tosViolationDecoder` is already defined for you since you have enough to do
   already.

   `customReportDecoder` needs to get the `String` value in the "text" field and
   wrap it in `Custom`.

   Once you get through that, give yourself a pat on the back, you earned it.
-}


type Report
    = TosViolation
    | Custom String


reportsDecoder : Decoder (List Report)
reportsDecoder =
    list reportDecoder


reportDecoder : Decoder Report
reportDecoder =
    fail "Who cares about reports?"


reportDecoderFromString : String -> Decoder Report
reportDecoderFromString reportString =
    fail "If I just knew what the reason field was, I could choose the right decoder."


tosViolationDecoder : Decoder Report
tosViolationDecoder =
    succeed TosViolation


customReportDecoder : Decoder Report
customReportDecoder =
    fail "How do we make a Custom report?"



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise08`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise08`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise08`
-}
