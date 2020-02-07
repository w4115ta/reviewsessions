(* ADTs give us a means to form composite types *)

type day =
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday

type street = string
type number = int
type zip = int
type address = Address of street * number * zip
