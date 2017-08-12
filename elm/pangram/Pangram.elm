module Pangram exposing (..)


isPangram : String -> Bool
isPangram sentence =
    let
        lowercasedSentence =
            String.toLower sentence
    in
        List.all (\letter -> String.contains letter lowercasedSentence)
            [ "a"
            , "b"
            , "c"
            , "d"
            , "e"
            , "f"
            , "g"
            , "h"
            , "i"
            , "j"
            , "k"
            , "l"
            , "m"
            , "n"
            , "o"
            , "p"
            , "q"
            , "r"
            , "s"
            , "t"
            , "u"
            , "v"
            , "w"
            , "x"
            , "y"
            , "z"
            ]
