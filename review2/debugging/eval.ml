
type term =
  | IVAL of int
  | BVAL of bool
  | SUM of term * term
  | AND of term * term

let rec eval t = match t with
  | IVAL x -> x
  | BVAL b -> b
  | SUM t1 t2 -> (eval t1) +  (eval t2)
  | AND t1 t2 -> (eval t1) && (eval t2)
