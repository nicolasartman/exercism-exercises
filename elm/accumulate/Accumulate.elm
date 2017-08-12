module Accumulate exposing (..)


iterate : (a -> b) -> List b -> List a -> List b
iterate fun processedItems remainingItems =
    let
        maybeHead =
            List.head remainingItems

        tail =
            List.tail remainingItems |> Maybe.withDefault []
    in
        case maybeHead of
            Just head ->
                iterate fun (processedItems ++ [ fun head ]) tail

            Nothing ->
                processedItems


accumulate : (a -> b) -> List a -> List b
accumulate accumulator list =
    iterate accumulator [] list



-- http://exercism.io/exercises/elm/accumulate/readme
