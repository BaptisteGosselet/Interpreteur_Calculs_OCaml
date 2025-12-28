
open Calculatrice.Lexer
open Calculatrice.Eval
open Calculatrice.Parser 

let readUserInput () : string =
  print_endline "Entrer une expression : ";
  read_line ()


let () =
  print_float (eval (parseTokens (tokenize (readUserInput ()))))