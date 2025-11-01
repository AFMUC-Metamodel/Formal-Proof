Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String. 
Require Import Coq.Bool.Bool. 
(*Load "reference location of AFMUC-mitigation_weaving_Def.v".*)
(* Lemma: weaving correctness *)
Lemma weaving_correct :
  forall (pc : Pointcut) (muc : AspectMisUsecaseModule.Threat) (aspect : AspectMitigationModule.Mitigation),
    exists output : WovenAFMUC,
      output = Build_WovenAFMUC
                aspect.(AspectMitigationModule.aspect_mitigation_name)
                (pointcut_name pc, "selection constraint applied")
                (selected_joinpoints (apply_pointcut pc muc), source_info (apply_pointcut pc muc))
                (match source_info (apply_pointcut pc muc) with
                   | "Basic Threat Flow" => Around
                   | "Precondition" => Before
                   | "Postcondition" => After
                   | _ => Unknown
                   end)
                aspect.(AspectMitigationModule.basicmitigationFlow)
                aspect.(AspectMitigationModule.precondition)
                aspect.(AspectMitigationModule.postcondition).
Proof.
  intros pc muc aspect.
  exists (Build_WovenAFMUC
            aspect.(AspectMitigationModule.aspect_mitigation_name)
            (pointcut_name pc, "selection constraint applied")
            (selected_joinpoints (apply_pointcut pc muc), source_info (apply_pointcut pc muc))
            (match source_info (apply_pointcut pc muc) with
               | "Basic Threat Flow" => Around
               | "Precondition" => Before
               | "Postcondition" => After
               | _ => Unknown
               end)
            aspect.(AspectMitigationModule.basicmitigationFlow)
            aspect.(AspectMitigationModule.precondition)
            aspect.(AspectMitigationModule.postcondition)).
  reflexivity.
Qed.    
Definition wovenAFMUC := weave_all [Pointcut1] [aspect1] AspectMC1. 
Compute wovenAFMUC.

Definition wovenAFMUC1 := weave_all [Pointcut4] [aspect1] AspectMC2. 
Compute wovenAFMUC.

Definition wovenAFMUC2 := weave_all [Pointcut5] [aspect2] AspectMC3. 
Compute wovenAFMUC.
 
Definition wovenAFMUC3 := weave_all [Pointcut6] [aspect2] AspectMC3. 
Compute wovenAFMUC.

Definition wovenAFMUC4 := weave_all [Pointcut7] [aspect2] AspectMC3. 
Compute wovenAFMUC.

Definition wovenAFMUC5 := weave_all [Pointcut8] [aspect2] AspectMC3. 
Compute wovenAFMUC.

Definition wovenAFMUC6 := weave_all [Pointcut9] [aspect2] AspectMC3. 
Compute wovenAFMUC.

 Definition wovenAFMUC7 := weave_all [ Pointcut3] [aspect3] AspectMC2. 
Compute wovenAFMUC.


Definition wovenAFMUC8 := weave_all [ Pointcut5; Pointcut6; Pointcut7; Pointcut8;Pointcut9] [aspect2] AspectMC3. 
Compute wovenAFMUC.


(*
(* instance Verification*)
Definition output1 := weaving Pointcut1 UC1 aspect1.
Compute output1. 
Definition output2 := weaving Pointcut2 UC2 aspect1. 
Compute output2.
Definition output3 := weaving Pointcut3 UC1 aspect2.
Compute output3.
Definition output4 := weaving Pointcut4 UC2 aspect2.
Compute output4.
Definition output5 := weaving Pointcut5 UC1 aspect3.
Compute output5.
Definition output6 := weaving Pointcut6 UC2 aspect3. 
Compute output6.

*)
 

 


