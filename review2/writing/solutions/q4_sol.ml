open Q3_sol;;

(** Write a function `depth` that calculates the height of a tree type *)
let rec depth = function
    | Nil -> 0
    | Node (_,t1,t2) -> 1 + (max (depth t1) (depth t2))
