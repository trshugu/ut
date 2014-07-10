(*
*)



#load "unix.cma" ;;
open Unix ;;
establish_server
    (fun inchan outchan ->
      print_endline (input_line inchan);
      close_in inchan)
    (ADDR_INET(inet_addr_any, 12345)) ;;


(*
#load "graphics.cma" ;;
Graphics.open_graph "" ;;
Graphics.draw_circle 100 100 50 ;;
*)



(*
let rec quicksort = function
  | [] -> []
  | pivot :: rest ->
     let is_less x = x < pivot in
     let left, right = List.partition is_less rest in
     quicksort left @ [pivot] @ quicksort right

let a = "asdf";;
print_endline a;;

let a = "aoao";;
print_endline a;;
*)


(*
let a = "asdf";;
print_endline a;;
let b = 1;;
print_endline b;;
*)



(*
print_endline "Hello world!";;
*)

