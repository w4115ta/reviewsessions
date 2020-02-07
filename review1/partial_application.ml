let matrix = [ [1;1;1;0] ; [1;1;0;0] ; [1;0;0;0] ; [0;0;0;0] ]

let vector_flip v = List.map (fun x -> if x = 1 then 0 else x) v

let matrix_flip m = List.map vector_flip m

let flipped = matrix_flip matrix
