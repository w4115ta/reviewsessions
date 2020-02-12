open Q3_sol;;

(** Write a function `is_sym` that returns whether or not a tree is symmetric 
 *  in terms of structure. 
 *)
let rec is_sym t = function
    | Nil -> true
    | Node(_,a,b) -> 
        let rec mirror t1 t2 =
          match (t1,t2) with
            | (Nil,Nil) -> true
            | (Node(_,t3,t4),Node(_,t5,t6)) -> (mirror t3 t5) && (mirror t4 t6)
            | _ -> false
        in mirror a b
