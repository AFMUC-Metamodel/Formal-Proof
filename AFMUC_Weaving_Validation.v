Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String. 
Require Import Coq.Bool.Bool. 
Load "C:\Users\shumaila.iqbal\OneDrive - Riphah International University\Documents\Ph.D research work\3. PhD dissertation\2. Metamodel\AFMUC_weaving_Definition.v".
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
Definition wovenAFMUC := weave_all [Pointcut1; Pointcut2] [UC1] aspect1. 
Compute wovenAFMUC.

 

 


