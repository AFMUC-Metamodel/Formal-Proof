(* Import necessary libraries *)  
Require Import String.
Require Import List. 
Import ListNotations.
Require Import Arith.
Require Import Coq.Strings.String.
Open Scope string_scope. 

Record SeqString : Set:= {
  seq_num : nat;
  value : string
}.
Module UsecaseModule.
Record Usecase: Set:= {
  uc_name: string;
  dependency: list string;
  precondition:list SeqString;
  basicFlow:list SeqString;
  postcondition:list SeqString;
}.
End UsecaseModule.
Record Pointcut : Set:= { 
  pointcut_name: string;
  pointcut_element: UsecaseModule.Usecase -> list SeqString; 
  selection_constraint: SeqString -> bool; 
}.
Record Joinpoint : Set:= {
  selected_joinpoints: list SeqString;
  source_info : string;
}.
Inductive AdviceType : Set:= Before | After | Around | Unknown.
Record Advice : Set:= {
  advice_type : AdviceType;
  threat_aspect: string;
  advice_behaviour: list SeqString;
  target_joinpoints: list SeqString;
}.
Module AspectMisUsecaseModule.
Record Threat: Set:= {
  aspectmuc_name : string;
  precondition:list SeqString;
  basicthreatFlow:list SeqString;
  postcondition:list SeqString;
}.
End AspectMisUsecaseModule.
Record Introduction : Set:= {
  introduction_name: string;
  introduced_AT: string -> list UsecaseModule.Usecase -> list UsecaseModule.Usecase;
  replace:  string -> AspectMisUsecaseModule.Threat -> list UsecaseModule.Usecase -> list (string * UsecaseModule.Usecase);
  introduced_AS: AspectMisUsecaseModule.Threat -> list UsecaseModule.Usecase -> list (string * UsecaseModule.Usecase * AspectMisUsecaseModule.Threat)
}.


(************Association Between Classes*****************)

(*function to extract name of use case attribute*)
Definition get_usecase_attribute (uc: UsecaseModule.Usecase) (attribute_name: string) : list SeqString :=
  if string_dec attribute_name "precondition" then UsecaseModule.precondition uc
  else if string_dec attribute_name "basicFlow" then UsecaseModule.basicFlow uc
  else UsecaseModule.postcondition uc.

(*selection constraint function*)

(* Adjusting the substring_constraint function to check if the entire string contains the substring *)
Fixpoint contains_substring (s sub : string) : bool :=
  match s with
  | EmptyString => false 
  | String c rest =>
      if string_dec  (substring 0 (String.length sub) s) sub
      then true 
      else contains_substring rest sub
  end. 

 
(* Function to check if a given substring appears anywhere in the string *)
Definition match_constraint (substr: string) (seq_str: SeqString) : bool :=  
if string_dec (substring 0 (String.length substr) (value seq_str)) substr then true
  else if contains_substring (value seq_str) substr then true
  else false.
  
(* Function to check if two lists of SeqString are equal *)
Fixpoint list_eqb (l1 l2 : list SeqString) : bool :=
  match l1, l2 with
  | [], [] => true
  | x1 :: xs1, x2 :: xs2 => if string_dec (value x1) (value x2) 
                            then list_eqb xs1 xs2 
                            else false
  | _, _ => false
  end.
(* Function to determine the source based on pointcut_element *)
Definition get_source_attribute (pc: Pointcut) (uc: UsecaseModule.Usecase) : string :=
  let check_elements := pointcut_element pc uc in
      if list_eqb check_elements (get_usecase_attribute uc "precondition")
      then "Precondition"
      else if list_eqb check_elements (get_usecase_attribute uc "basicFlow")
      then "Basic Flow"
      else if list_eqb check_elements (get_usecase_attribute uc "postcondition")
      then "Postcondition"
      else "unnown source".


(* Function to select joinpoints and source of joinpoints based on pointcut*)
Definition apply_pointcut (pc: Pointcut) (uc: UsecaseModule.Usecase) : Joinpoint :=
  let attr_list := pointcut_element pc uc in
  let joinpoints := filter (selection_constraint pc) attr_list in
  let source := get_source_attribute pc uc in
  Build_Joinpoint joinpoints source.

(* Function to determine advice_type and apply advice_behaviour *)
Definition apply_advice (jp: Joinpoint) (aspect: AspectMisUsecaseModule.Threat) : Advice :=
  let source := jp.(source_info) in
  let aspect_name := aspect.(AspectMisUsecaseModule.aspectmuc_name) in  
  let advice_type :=
    match source with
    | "Basic Flow" => Around
    | "Precondition" => Before
    | "Postcondition" => After
    | _ => Unknown
    end
  in
  let advice_behaviour := AspectMisUsecaseModule.basicthreatFlow aspect in
  (* Construct the Advice record using selected_joinpoints *)
  {| advice_type := advice_type;
     threat_aspect := aspect_name;  
     advice_behaviour := advice_behaviour;
     target_joinpoints := jp.(selected_joinpoints)
  |}.


(*******************\\\\\\\\\\\\\\\introduction///////////////**********************)
(* Function to replace use case attributes with threat attributes *)
Definition replace_usecase 
  (threat: AspectMisUsecaseModule.Threat)
  (usecases: list UsecaseModule.Usecase) : list UsecaseModule.Usecase :=
  map (fun uc =>
    {|
      UsecaseModule.uc_name := UsecaseModule.uc_name uc;
      UsecaseModule.dependency := UsecaseModule.dependency uc;
      UsecaseModule.precondition := AspectMisUsecaseModule.precondition threat;
      UsecaseModule.basicFlow := AspectMisUsecaseModule.basicthreatFlow threat;
      UsecaseModule.postcondition := AspectMisUsecaseModule.postcondition threat
    |}) usecases.

(* Function to filter use cases by precondition using substring constraint *)
Definition filter_usecases_by_precondition 
  (substr: string) 
  (usecases: list UsecaseModule.Usecase) : list UsecaseModule.Usecase :=
  filter (fun uc =>
    existsb (match_constraint substr) (UsecaseModule.precondition uc)
  ) usecases.

(* Function to associate threat with use case by repalcing its attributes *)
Definition introduce_threat
  (intro_name: string)
  (substr: string)
  (threat: AspectMisUsecaseModule.Threat)
  (usecases: list UsecaseModule.Usecase) : list (string * UsecaseModule.Usecase) :=
  let introduced_AT := filter_usecases_by_precondition substr usecases in
  let replace_usecase (uc: UsecaseModule.Usecase) : UsecaseModule.Usecase :=
    {|
      UsecaseModule.uc_name := UsecaseModule.uc_name uc;
      UsecaseModule.dependency := UsecaseModule.dependency uc;
      UsecaseModule.precondition := AspectMisUsecaseModule.precondition threat;
      UsecaseModule.basicFlow := AspectMisUsecaseModule.basicthreatFlow threat;
      UsecaseModule.postcondition := AspectMisUsecaseModule.postcondition threat
    |} in
  let replaced_usecases := map replace_usecase introduced_AT in
  map (fun uc => (intro_name, uc)) replaced_usecases.


 (*DEBUGGING FUNCTION*)
Definition match_constraint_debug (substr: string) (seq_str: SeqString) : (bool * string) :=
  (match_constraint substr seq_str, "Checking if the sequence contains: " ++ substr).


(*///////DEFAULT FUNCTIONS/////*)
(* Define a default no-op function for replace *)
Definition default_replace 
(substr: string) 
(threat: AspectMisUsecaseModule.Threat) 
(usecases: list UsecaseModule.Usecase) : list (string * UsecaseModule.Usecase) :=
  map (fun uc => ( "", uc)) usecases.  

(* Define a default no-op function for introduced_AS *)
Definition default_introduced_AS 
  (threat: AspectMisUsecaseModule.Threat) 
  (usecases: list UsecaseModule.Usecase) 
  : list (string * UsecaseModule.Usecase * AspectMisUsecaseModule.Threat) :=
  [].
(* Function to add a dependency to a use case *)
Definition add_threat_dependency (uc: UsecaseModule.Usecase) (dep: string) : UsecaseModule.Usecase :=
  {|
    UsecaseModule.uc_name := uc.(UsecaseModule.uc_name);
    UsecaseModule.dependency := dep :: uc.(UsecaseModule.dependency); (* Add new dependency *)
    UsecaseModule.precondition := uc.(UsecaseModule.precondition);
    UsecaseModule.basicFlow := uc.(UsecaseModule.basicFlow);
    UsecaseModule.postcondition := uc.(UsecaseModule.postcondition)
  |}.

(* Modified associate_threat_with_usecase *)
Definition associate_threat_with_usecase
  (association: string) (* Pass the association type dynamically, e.g., "INCLUDED" or "EXTENDEDBY" *)
  (threat: AspectMisUsecaseModule.Threat)
  (usecases: list UsecaseModule.Usecase) : list (string * UsecaseModule.Usecase * AspectMisUsecaseModule.Threat) :=
  map (fun uc =>
    let new_dependency := association ++ " " ++ threat.(AspectMisUsecaseModule.aspectmuc_name) in
    let new_uc := add_threat_dependency uc new_dependency in 
    (association, new_uc, threat)
  ) usecases.

                               (* ************* THE END**************** *)

