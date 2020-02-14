
type iterm =
  | IVAL of int
  | SUM of iterm * iterm

type bterm =
  | BVAL of bool
  | AND of bterm * bterm

type term =
  | ITERM of iterm
  | BTERM of bterm

type ('a, 'b) either =
  | Left  of 'a
  | Right of 'b

let rec eval t =
  let rec evalint t = match t with
    | IVAL x -> x
    | SUM (t1, t2) -> (evalint t1) + (evalint t2) in
  let rec evalbool t = match t with
    | BVAL b -> b
    | AND (t1, t2) -> (evalbool t1) && (evalbool t2) in
  match t with
  | ITERM t -> Left  (evalint  t)
  | BTERM b -> Right (evalbool b)
