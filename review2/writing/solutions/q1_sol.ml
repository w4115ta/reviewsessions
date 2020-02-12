open List;;

(** Write `rev` that takes in a list and reverses it *)
let rec rev = function
    | x::xs -> (rev xs) @ [x]
    | [] -> []

(** Can you write one in linear time? *)
let rev_ =
    let rec helper accum = function
        | x::xs -> helper (x::accum) xs
        | [] -> accum
    in helper []


(** Can you write one using a fold :0 ! *)
let rev__ = fold_left (fun accum x -> x::accum) [] (* Good time complexity! *)
let rev___ = fold_right (fun x accum -> accum @ [x]) [] (* Bad time complexity *)
