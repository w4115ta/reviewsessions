(* definition of drop from haskell stdlib *)
let rec drop n l =
  if n = 0 then l else match l with
  | [] -> []
  | x :: xs -> drop (n - 1) xs

let l  = [0; 1; 2; 3; 4; 5]

let l' = drop 1 (List.map (fun x -> 100 / x) l)

