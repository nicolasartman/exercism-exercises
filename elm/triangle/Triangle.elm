module Triangle exposing (..)

import Set


version : Int
version =
    2


type Triangle
    = Isosceles
    | Equilateral
    | Scalene


obeysTriangleInequality : List Float -> Bool
obeysTriangleInequality triangleSides =
    let
        sortedSides =
            List.sort triangleSides
    in
        case sortedSides of
            [ side1, side2, side3 ] ->
                side1 + side2 > side3

            _ ->
                False


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind side1 side2 side3 =
    let
        sides =
            [ side1, side2, side3 ]
    in
        if List.any ((>=) 0) sides then
            Result.Err "Invalid lengths"
        else if not <| obeysTriangleInequality sides then
            Result.Err "Violates inequality"
        else
            let
                numberOfUniqueSides =
                    Set.size << Set.fromList <| sides
            in
                if numberOfUniqueSides == 1 then
                    Result.Ok Equilateral
                else if numberOfUniqueSides == 2 then
                    Result.Ok Isosceles
                else
                    Result.Ok Scalene
