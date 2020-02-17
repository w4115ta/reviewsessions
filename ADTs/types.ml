
(* ocaml comes with various standard types.
   here are examples of a few:
 *)

let _ : string = "foo"
let _ : int    = 24
let _ : bool   = true
let _ : int list = [ 1 ; 2 ; 3 ]

(* the type system lets us combine existing types to form composite types.
   the simplest form of a type definition is a *type alias*:
 *)

type name = string

let _ : name = "alice"

(* there are three forms of composite types: products, sums, and arrows.

   let's look at products first:
 *)

type intpair = int * int

(* here are some example values:
 *)

let _ : intpair = (1, 2)
let _ : bool * string = (true, "foo")

(* you can think of the star operator as a *type-level function*
   that takes two types and forms their product.

   if you're familiar with mathematical logic, product types feel a lot
   like logical conjunction...
   to form a value of type ('a * 'b) we need an element of 'a *and* an
   element of 'b, just like to form a proof of the proposition
   A /\ B we need a proof of A *and* a proof of B.

   or, if you like to think of types as sets, then product types are
   like cartesian products.

   now let's look at sum types:
 *)

type intorbool =
  | I of int
  | B of bool

(* here are some example values:
 *)

let _ : intorbool = I 100
let _ : intorbool = B true

(* this definition says: to form a value of type intorbool, you must
   give either an int or a bool.

   the *of* keyword is a reserved word for sum types.

   I and B are called the *data constructors* for intorbool.
   (intorbool is called the *type constructor*.)

   it can be useful to think of the data constructors as functions:
   I : int  -> intorbool
   B : bool -> intorbool
   however, they are not exactly like functions, because data constructors
   can't be partially applied.

   if you're familiar with mathematical logic, sum types feel a lot
   like logical disjunction...

   or, if you like to think of types as sets, then sum types are like
   tagged unions.

   note that the following definition will not compile:
 *)

(* type intorbool = int | bool *)

(* if this definition was allowed, what would be the type of the
   expression 5 ? it could be an int, or it could be an intorbool...

   constructors for sum types need not take arguments.
   such constructors are called nullary constructors:
 *)

type library =
  | Butler
  | Avery
  | Engineering
  | Math

let _ : library = Butler

(* so far, we've seen only monomorphic types - types whose type constructors
   don't take any arguments. we can also define polymorphic types, or types
   with type constructors that are parameterized by other types:
 *)

type 'a option =
  | None
  | Some of 'a

(* here are some example values:
 *)

let _ : int option = None
let _ : int option = Some 20

(* i find it useful to think of polymorphic types as type-level functions:
   option : type -> type

   here are some more examples polymorphic types:
 *)

type 'a mylist =
  | Nil
  | Cons of 'a * 'a mylist

let _ : bool mylist = Nil
let _ : bool mylist = Cons (true, Nil)
let _ : bool mylist = Cons (false, Cons (true, Nil))

type ('a, 'b) either =
  | Left  of 'a
  | Right of 'b

let _ : (int, bool)   either = Left 4
let _ : (int, string) either = Left 4
let _ : (int, bool)   either = Right true

type 'a vector = Vector of 'a * 'a * 'a

let _ : int vector = Vector (1, 2, 3)

(* the last kind of composite type is the arrow type
 *)

type intofstring = string -> int

(* examples:
 *)

let _ : intofstring = String.length
let _ : intofstring = fun s -> 0

(* these are sometimes called *exponential* types.
   can you see why?

   ocaml also has record types, which are like
   unordered product types:
 *)

type person = {
    name : string;
    age  : int;
  }

(* some example values:
 *)

let _ : person = { name = "eowyn" ; age = 24  }
let _ : person = { age = 262 ; name = "gimli" }

(* as a final example, let's define a polymorphic tree type
 *)

type 'a tree =
  | Leaf of 'a
  | Tree of 'a tree * 'a tree

(* and let's define a treemap function that maps a function onto
   the values of the leaves
 *)

let rec treemap (f : 'a -> 'b) (t : 'a tree) : 'b tree =
  match t with
  | Leaf a -> Leaf (f a)
  | Tree (t1, t2) -> Tree (treemap f t1, treemap f t2)

let example_tree : int tree = Tree (Leaf 1, Leaf 2)
let example_tree' : int tree = treemap ((+) 1) example_tree
