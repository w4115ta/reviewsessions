
let rec f c list = match list with
  | [] -> []
  | x :: xs ->
     let x' = x * c in
     print_int x' ;
     (x * c) :: (f c xs)
