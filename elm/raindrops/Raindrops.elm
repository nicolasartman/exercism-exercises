module Raindrops exposing (..)


factorsAndSounds : List ( number, String )
factorsAndSounds =
    [ ( 3, "Pling" )
    , ( 5, "Plang" )
    , ( 7, "Plong" )
    ]


produceSound : Int -> ( Int, String ) -> String
produceSound numberOfDrops ( factor, sound ) =
    if rem numberOfDrops factor == 0 then
        sound
    else
        ""


isNotSilent : String -> Bool
isNotSilent =
    not << String.isEmpty


raindrops : Int -> String
raindrops numberOfDrops =
    let
        sound =
            List.map (produceSound numberOfDrops) factorsAndSounds
                |> List.foldr (++) ""
    in
        if sound |> isNotSilent then
            sound
        else
            toString numberOfDrops



-- http://exercism.io/exercises/elm/raindrops/readme
