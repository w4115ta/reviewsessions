(** What happens when given two lists of different length? *)
let rec zip l1 l2 = 
  match (l1,l2) with
    | (x::xs,x'::xs') -> (x,x')::(zip xs xs')
    | _ -> []
