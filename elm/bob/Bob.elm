module Bob exposing (..)

import Regex exposing (regex)


hey : String -> String
hey message =
    if message |> Regex.contains (regex "^[\\s\\t\\n]*$") then
        "Fine. Be that way!"
    else if
        Regex.contains (regex "[A-Z]+") message
            && message
            == String.toUpper message
    then
        "Whoa, chill out!"
    else if message |> String.endsWith "?" then
        "Sure."
    else
        "Whatever."
