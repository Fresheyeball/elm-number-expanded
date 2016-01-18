module Cardinal (..) where

{-|
Cardinal Numbers
(maybe this is the wrong name)
A number that can either be finite or infinite

@docs Cardinal, toCardinal, withDefault, withDefaults, map
-}


{-| Cardinal number can be Positive or Negative Infinity
-}
type Cardinal number
    = Finite number
    | PosInfinity
    | NegInfinity


{-| -}
toCardinal : number -> Cardinal number
toCardinal =
    Finite


{-|
Get the value out of `Cardinal` providing a default for the infinite case
-}
withDefault : a -> (number -> a) -> Cardinal number -> a
withDefault default f card =
    case card of
        Finite x ->
            f x

        _ ->
            default


{-|
Get the value out of `Cardinal` providing a default for the infinite cases.
First argument is the default for the `PosInfinity` case, the second is for `NegInfinity`
-}
withDefaults : a -> a -> (number -> a) -> Cardinal number -> a
withDefaults posdef negdef f card =
    case card of
        Finite x ->
            f x

        PosInfinity ->
            posdef

        NegInfinity ->
            negdef


{-|
Not a Functor, but still mappable
-}
map : (number -> number) -> Cardinal number -> Cardinal number
map f card =
    case card of
        Finite x ->
            Finite (f x)

        infinity ->
            infinity
