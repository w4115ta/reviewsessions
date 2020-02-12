open List;;

type 'a node =
    | One of 'a
    | Many of 'a node list;;

(** Write a function `flatten` that flattens this nested list structure *)
let flatten l = 
    let rec helper accum = function
        | []    -> accum
        | x::xs -> (match x with 
                    | One e  -> helper (e::accum) xs
                    | Many l -> helper (helper accum l) xs)
    in rev (helper [] l)
