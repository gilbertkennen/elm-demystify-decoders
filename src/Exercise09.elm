module Exercise09 exposing (Author(Pseudonym, Default), authorsDecoder)

import Exercise05 exposing (Id(Id))
import Json.Decode exposing (Decoder, fail)


{- Moving on:

       "authors" : [ { "user-id" : 5, "pen-name" : "Leo" },
                     { "user-id" : 7, "pen-name" : null }
                   ],

   Another list of objects, but this time they are more regular.

   If a pen name isn't used for a particular author, we are supposed to use the
   user's default name (via an API query, yes this is a horrible API and we
   can't change it). The data we want out is either the `String` of the
   pseudonym or the user-id of the user as an `Id` (remember Exercise05?).

   A type and a function to construct that type from the decoded values is
   provided.

   You will need just one new tool, some way of possibly decoding a value, but
   handling the possibility of null. The normal way to handle this is with a
   `Maybe`. You are looking for a function which will apply a decoder if the
   value is non-null and return `Nothing` if it is.
-}


type Author
    = Pseudonym String
    | Default Id


authorsDecoder : Decoder (List Author)
authorsDecoder =
    fail "Decode ALL the things!"


authorDecoder : Decoder Author
authorDecoder =
    fail "Decode just one."


mkAuthor : Maybe String -> Int -> Author
mkAuthor pseudonym id =
    case pseudonym of
        Nothing ->
            Default (Id id)

        Just pName ->
            Pseudonym pName



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise09`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise09`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise09`
-}
