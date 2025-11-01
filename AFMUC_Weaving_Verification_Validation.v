Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String. 
Require Import Coq.Bool.Bool. 
Load "AFMUC_weaving_Definition.v".
Load "AFMUC_Instances.v".
(* Lemma: weaving correctness *)
Lemma weaving_correct :
  forall (pc : Pointcut) (uc : UsecaseModule.Usecase) (aspect : AspectMisUsecaseModule.Threat),
    exists output : WovenAFMUC,
      output = Build_WovenAFMUC
                aspect.(AspectMisUsecaseModule.aspectmuc_name)
                (pointcut_name pc, "selection constraint applied")
                (selected_joinpoints (apply_pointcut pc uc), source_info (apply_pointcut pc uc))
                (match source_info (apply_pointcut pc uc) with
                   | "Basic Flow" => Around
                   | "Precondition" => Before
                   | "Postcondition" => After
                   | _ => Unknown
                   end)
                aspect.(AspectMisUsecaseModule.basicthreatFlow)
                aspect.(AspectMisUsecaseModule.precondition)
                aspect.(AspectMisUsecaseModule.postcondition).
Proof.
  intros pc uc aspect.
  exists (Build_WovenAFMUC
            aspect.(AspectMisUsecaseModule.aspectmuc_name)
            (pointcut_name pc, "selection constraint applied")
            (selected_joinpoints (apply_pointcut pc uc), source_info (apply_pointcut pc uc))
            (match source_info (apply_pointcut pc uc) with
               | "Basic Flow" => Around
               | "Precondition" => Before
               | "Postcondition" => After
               | _ => Unknown
               end)
            aspect.(AspectMisUsecaseModule.basicthreatFlow)
            aspect.(AspectMisUsecaseModule.precondition)
            aspect.(AspectMisUsecaseModule.postcondition)).
  reflexivity.
Qed.   
Definition wovenAFMUC1 := weave_all [Pointcut1] [UC1] aspect1. 
Compute wovenAFMUC1.
Definition wovenAFMUC2 := weave_all [Pointcut2] [UC2] aspect1. 
Compute wovenAFMUC2.
Definition wovenAFMUC3 := weave_all [Pointcut3] [UC3] aspect1. 
Compute wovenAFMUC3.
Definition wovenAFMUC4 := weave_all [Pointcut4] [UC1] aspect2. 
Compute wovenAFMUC4.
Definition wovenAFMUC5 := weave_all [Pointcut5] [UC2] aspect2. 
Compute wovenAFMUC5. 
Definition wovenAFMUC6 := weave_all [Pointcut6] [UC3] aspect2. 
Compute wovenAFMUC6.
Definition wovenAFMUC7 := weave_all [Pointcut7] [UC6] aspect2. 
Compute wovenAFMUC7.
Definition wovenAFMUC8 := weave_all [Pointcut8] [UC2] aspect3. 
Compute wovenAFMUC8.
Definition wovenAFMUC9 := weave_all [Pointcut9] [UC7] aspect3. 
Compute wovenAFMUC9.
Definition wovenAFMUC10 := weave_all [Pointcut10] [UC5] aspect3. 
Compute wovenAFMUC10.  
Definition wovenAFMUC11 := weave_all [Pointcut11] [UC6] aspect3. 
Compute wovenAFMUC11.

(****************************************************************************)
(*introduction instances*)

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

Eval compute in 
  let substr := "reservation URL" in
  let threat := aspect4 in
  let usecases := usecaseslist in
  introduce_threat
    (introduction_name intro1)  
    substr 
    threat
    (introduced_AT intro1 substr usecases). 

Eval compute in 
  let substr := "loyalty" in
  let threat := aspect4 in
  let usecases := usecaseslist in
  introduce_threat
    (introduction_name intro1)  
    substr 
    threat
    (introduced_AT intro1 substr usecases).   
(*^^^^^^^^^^^^^^ Instance Verification^^^^^^^^^^^^^^*) 
Eval compute in 
  let substr := "loyalty" in
  let threat := aspect5 in
  let usecases := usecaseslist in
  let filtered_usecases := (introduced_AT intro2 substr usecases) in
  introduced_AS intro2 threat filtered_usecases.



  
(****************************************************************************)
