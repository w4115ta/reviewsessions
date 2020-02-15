open List;;

(** 2D list, list of lists! *)
let m = [[1;0;1;0;1];
         [1;34;23;101];
         [1231;0;1;1];
         [-2048;1000;25;111];
         [1;1;1;1;1];
         [1010;101;101;1;12]]

let num_elements m = fold_left (+) 0 (map length m)

let matrix_sum m = fold_left (+) 0 (map (fold_left (+) 0) m)

let find_max m = 
    let rec lmax = fold_left (fun m x -> max m (Some x)) None in
    let rec maybemax = fold_left (fun m x -> max m x) None in
    maybemax (map lmax m)
