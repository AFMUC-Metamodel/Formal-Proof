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
Module AspectMisUsecaseModule.
Record Threat: Set:= {
  aspectmuc_name : string;
  precondition:list SeqString;
  basicthreatFlow:list SeqString;
  postcondition:list SeqString;
}.
End AspectMisUsecaseModule.

Module AspectMitigationModule.
Record Mitigation:= {
  aspect_mitigation_name: string;
  precondition:list SeqString;
  basicmitigationFlow:list SeqString;
  postcondition:list SeqString;  
}.
End AspectMitigationModule.

Record Pointcut : Set:= { 
  pointcut_name: string;
  pointcut_element: AspectMisUsecaseModule.Threat -> list SeqString; 
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



(************Association Between Classes*****************)

(*function to extract name of use case attribute*)
Definition get_misusecase_attribute (muc: AspectMisUsecaseModule.Threat) (attribute_name: string) : list SeqString :=
  if string_dec attribute_name "precondition" then AspectMisUsecaseModule.precondition muc
  else if string_dec attribute_name "basicthreatFlow" then AspectMisUsecaseModule.basicthreatFlow muc
  else AspectMisUsecaseModule.postcondition muc.

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
Definition get_source_attribute (pc: Pointcut) (muc: AspectMisUsecaseModule.Threat) : string :=
  let check_elements := pointcut_element pc muc in
      if list_eqb check_elements (get_misusecase_attribute muc "precondition")
      then "Precondition"
      else if list_eqb check_elements (get_misusecase_attribute muc "basicthreatFlow")
      then "Basic Threat Flow"
      else if list_eqb check_elements (get_misusecase_attribute muc "postcondition")
      then "Postcondition"
      else "unnown source".


(* Function to select joinpoints and source of joinpoints based on pointcut*)
Definition apply_pointcut (pc: Pointcut) (muc: AspectMisUsecaseModule.Threat) : Joinpoint :=
  let attr_list := pointcut_element pc muc in
  let joinpoints := filter (selection_constraint pc) attr_list in
  let source := get_source_attribute pc muc in
  Build_Joinpoint joinpoints source.

(* Function to determine advice_type and apply advice_behaviour *)
Definition apply_advice (jp: Joinpoint) (aspect: AspectMitigationModule.Mitigation) : Advice :=
  let source := jp.(source_info) in
  let aspect_name := aspect.(AspectMitigationModule.aspect_mitigation_name) in  
  let advice_type :=
    match source with
    | "basicthreatFlow" => Around
    | "precondition" => Before
    | "postcondition" => After
    | _ => Unknown
    end
  in
  let advice_behaviour := AspectMitigationModule.basicmitigationFlow aspect in
  (* Construct the Advice record using selected_joinpoints *)
  {| advice_type := advice_type;
     threat_aspect := aspect_name;  
     advice_behaviour := advice_behaviour;
     target_joinpoints := jp.(selected_joinpoints)
  |}.



                               (* ************* THE END**************** *)

