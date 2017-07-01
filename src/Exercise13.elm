module Exercise13 exposing (Reply(Reply), repliesDecoder)

import Json.Decode exposing (Decoder, fail)


{- I can see my house from here!:


       "replies" : [ { "body" : "I learned a lot!",
                       "replies" : [ { "body" : "So did I!",
                                       "replies" : []
                                     }
                                   ]
                     }
                   ]

   This should seem mostly alright by now except, is that recursion? Yes, there
   is an indefinite depth of replies possible here. If we tried to write this
   function naively it would call itself and Elm would throw a fit. See, Elm is
   eagerly evaluated (a.k.a. strict evaluation) meaning that it tries to do
   everything as soon as all arguments are available. This creates an infinite
   loop in the case of decoders.

   What we need now is some way of not evaluating the recursive call until it is
   actually needed--so-called lazy evaluation.
-}


type Reply
    = Reply
        { body : String
        , replies : List Reply
        }


repliesDecoder : Decoder (List Reply)
repliesDecoder =
    fail "This part should be super-easy by now, but it might be different this time."


replyDecoder : Decoder Reply
replyDecoder =
    fail "This part can be tricky."



{- Once you think you're done, run the tests for this exercise from the root of
   the project:

   - If you have installed `elm-test` globally:
        `elm test tests/Exercise12`

   - If you have installed locally using `npm`:
        `npm run elm-test tests/Exercise12`

   - If you have installed locally using `yarn`:
        `yarn elm-test tests/Exercise12`
-}
