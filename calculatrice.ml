
type op = ADD | SUB | MUL | DIV;;

(* Définir la structure d'arbre *)
type expr =
  | NOMBRE of float
  | OP of op * expr * expr (*n-uplet*)

(* Lire la saisie utilisateur *)
let readInput : string =
  print_endline "Entrer une expression : ";
  String.concat "" (String.split_on_char ' ' (read_line ()));;

let rec eval (e:expr) : float = 
  match e with
  | NOMBRE n -> n
  | OP (ADD, e1, e2) -> eval e1 +. eval e2
  | OP (SUB, e1, e2) -> eval e1 -. eval e2
  | OP (MUL, e1, e2) -> eval e1 *. eval e2
  | OP (DIV, e1, e2) -> eval e1 /. eval e2;;

let abrTest:expr = OP (SUB, (NOMBRE 3.0),(NOMBRE 4.0));;
print_float (eval abrTest);;