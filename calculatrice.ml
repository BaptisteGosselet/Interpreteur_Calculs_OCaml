#load "str.cma";;
open Str

(* Définition des types *)
type op = ADD | SUB | MUL | DIV;;

type expr =
  | NOMBRE of float
  | OP of op * expr * expr (*n-uplet*)

type token =
  | TNombre of float
  | TPlus
  | TMoins
  | TFois
  | TDiv
  | TParG
  | TParD

(* attention aux caractères spéciaux *)
let morphemsRegexDelimiters = "\\([0-9]+\\(\\.[0-9]+\\)?\\|[()+\\-*/]\\)"

(* Fonctions de tests *)
let rec afficheStrList (lst:(string list)): unit =
  match lst with 
  | [] -> ()
  | e::rst -> (print_endline (String.concat "elem:" [""; e])) ; (afficheStrList rst)

let afficheTokenList (tokens : token list) : unit =
  tokens
  |> List.map (function
      | TNombre e -> "TNombre=" ^ (string_of_float e)
      | TPlus -> "TPlus"
      | TMoins -> "TMoins"
      | TFois -> "TFois"
      | TDiv -> "TDiv"
      | TParG -> "TParG"
      | TParD -> "TParD")
  |> String.concat " "
  |> print_endline
;;


(* Tokenization *)
let splitMorphems (s:string) : string list =
  let matches = Str.full_split (Str.regexp morphemsRegexDelimiters) s in
  List.rev (
    List.fold_left (fun acc e ->
      match e with
      | Str.Text t when t <> "" -> t :: acc
      | Str.Delim d -> d :: acc
      | _ -> acc  
    ) [] matches
  )

let tokenize (s:string) : (token list) = 
  let lst = (splitMorphems s) in 
  List.rev (
  List.fold_left 
    (fun acc e -> match float_of_string_opt e with 
      | Some nb -> (TNombre nb) :: acc
      | None -> match e with 
        | "(" -> (TParG) :: acc 
        | ")" -> (TParD) :: acc
        | "+" -> (TPlus) :: acc
        | "-" -> (TMoins) :: acc
        | "*" -> (TFois) :: acc
        | "/" -> (TDiv) :: acc
        | _ -> failwith ("Token non reconnu : " ^ e)
    ) 
    [] 
    lst
  )

let readUserInput () : string =
  print_endline "Entrer une expression : ";
  String.concat "" (String.split_on_char ' ' (read_line ()));;


(* MAIN *)
let () =
  (*let s = readUserInput () in*)
  let s = "(5.2-63)*32.1" in
  afficheStrList (splitMorphems s);
  afficheTokenList (tokenize s)

(* BROUILLON *)

let rec eval (e:expr) : float = 
  match e with
  | NOMBRE n -> n
  | OP (ADD, e1, e2) -> eval e1 +. eval e2
  | OP (SUB, e1, e2) -> eval e1 -. eval e2
  | OP (MUL, e1, e2) -> eval e1 *. eval e2
  | OP (DIV, e1, e2) -> eval e1 /. eval e2;;

(*let abrTest:expr = OP (SUB, (NOMBRE 3.0),(NOMBRE 4.0));;*)
(*print_float (eval abrTest);;*)

