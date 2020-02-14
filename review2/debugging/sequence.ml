(* multiply each element of a list by a constant c
   print the result as we iterate
 *)

let rec f c list = match list with
  | [] -> []
  | x :: xs ->
     let x' = x * c in
     (x * c) :: (f c xs) ;
     print_int x'
