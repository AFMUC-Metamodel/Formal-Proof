Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String.
Require Import Coq.Bool.Bool.
Load "AFMUC_Definitions.v".
Load "AFMUC_Instances.v".



(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Compute get_usecase_attribute UC1 "basicFlow". 

(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)

Eval compute in map (match_constraint "customer enters") UC1_basicFlow.
(*Eval compute in map (fun seq_str => (match_constraint "customer enters" seq_str, 
                                      "customer enters")) UC1_basicFlow.*)
 
(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Eval compute in apply_pointcut Pointcut1 UC1.


(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)

Eval compute in apply_advice Joinpoint1 aspect1.


(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Eval compute in (filter_usecases_by_precondition "registration URL" usecaseslist).

(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
 (* Default case for introduce_AS *)
Eval compute in (default_introduced_AS aspect4 usecaseslist).
(*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*)

(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
(* Evaluate replace_usecase with the example threat and usecases *)
Eval compute in (replace_usecase aspect1 usecaseslist).
 
(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Eval compute in 
  let substr := "registration URL" in
  let threat := aspect4 in
  let usecases := usecaseslist in
  introduce_threat
    (introduction_name intro1)  
    substr 
    threat
    (introduced_AT intro1 substr usecases).   

(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Eval compute in
  let substr := "registration" in
  let threat := aspect5 in
  let usecases := usecaseslist in
  let filtered_usecases := (introduced_AT intro2 substr usecases) in
  introduced_AS intro2 threat filtered_usecases.







                                (* ************* THE END**************** *)











