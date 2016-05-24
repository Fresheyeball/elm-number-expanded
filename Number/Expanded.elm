module Number.Expanded exposing (..)

{-|
Expanded Numbers
A number that can either be finite or infinite

@docs Expanded, toExpanded, withDefault, withDefaults, map
-}


{-| Expanded number can be Positive or Negative Infinity
-}
type Expanded number
    = Finite number
    | PosInfinity
    | NegInfinity


{-| -}
toExpanded : number -> Expanded number
toExpanded =
    Finite


{-|
Get the value out of `Expanded` providing a default for the infinite case
-}
withDefault : a -> (number -> a) -> Expanded number -> a
withDefault default f card =
    case card of
        Finite x ->
            f x

        _ ->
            default


{-|
Get the value out of `Expanded` providing a default for the infinite cases.
First argument is the default for the `PosInfinity` case, the second is for `NegInfinity`
-}
withDefaults : a -> a -> (number -> a) -> Expanded number -> a
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
map : (number -> number) -> Expanded number -> Expanded number
map f card =
    case card of
        Finite x ->
            Finite (f x)

        infinity ->
            infinity
