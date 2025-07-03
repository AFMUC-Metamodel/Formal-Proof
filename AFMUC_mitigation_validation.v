Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String.
Require Import Coq.Bool.Bool.
(*
Load "C:\Users\shumaila.iqbal\OneDrive - Riphah International University\Documents\Ph.D research work\3. PhD dissertation\2. Metamodel\AFMUC_mitigation_definition.v". 
*)
Load "C:\Users\shumaila.iqbal\OneDrive - Riphah International University\Documents\Ph.D research work\3. PhD dissertation\2. Metamodel\AFMUC_mitigation_instances.v".



(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Compute get_misusecase_attribute aspect1 "basicthreatFlow". 

(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)

Eval compute in map (match_constraint "PROVIDES SQLI VALUES IN") AspectMUC1_basicthreatflow.
(*Eval compute in map (fun seq_str => (match_constraint "customer enters" seq_str, 
                                      "customer enters")) UC1_basicFlow.*)
 
(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)
Eval compute in apply_pointcut Pointcut1 aspect1.


(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*)

Eval compute in apply_advice Joinpoint1 AspectMC1.










                                (* ************* THE END**************** *)











