Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String.
Require Import Coq.Bool.Bool.
(*Follwing files are required dependencies that must be defined here*)
(*Replace path_to_project with the directory where the project files are in your system*)
Load "path_to_project/ AFMUC_Threat_Definition.v".

(******************)
Record WovenAFMUC : Set := {
  aspect_misusecase_name : string;
  threat_pointcut : (string * string);
  threat_joinpoints : (list SeqString * string);
  advice : AdviceType;
  threat_precondition : list SeqString;
  threat_behaviour : list SeqString;
  threat_postcondition : list SeqString
}.
Definition weaving
  (pc: Pointcut) 
  (uc: UsecaseModule.Usecase) 
  (aspect: AspectMisUsecaseModule.Threat) : WovenAFMUC :=
  let threat_name := aspect.(AspectMisUsecaseModule.aspectmuc_name) in
  let pointcut_info := (pointcut_name pc, "selection constraint applied") in
  let jp := apply_pointcut pc uc in
  let joinpoints_info := (jp.(selected_joinpoints), jp.(source_info)) in
  let advice_type :=
    match jp.(source_info) with
    | "Basic Flow" => Around
    | "Precondition" => Before
    | "Postcondition" => After
    | _ => Unknown
    end in
  let advice_behaviour := aspect.(AspectMisUsecaseModule.basicthreatFlow) in
  let precondition := aspect.(AspectMisUsecaseModule.precondition) in
  let postcondition := aspect.(AspectMisUsecaseModule.postcondition) in
  {| 
    aspect_misusecase_name := threat_name;
    threat_pointcut := pointcut_info;
    threat_joinpoints := joinpoints_info;
    advice := advice_type;
    threat_precondition := precondition;    
    threat_behaviour := advice_behaviour;
    threat_postcondition := postcondition
  |}.
Fixpoint weave_all (pcs : list Pointcut) (ucs : list UsecaseModule.Usecase) (aspect : AspectMisUsecaseModule.Threat) : list WovenAFMUC :=
  match pcs, ucs with
  | pc :: pcs', uc :: ucs' => weaving pc uc aspect :: weave_all pcs' ucs' aspect
  | _, _ => nil
  end.

        (*----------------------Lemma Proof of Weaving Algorithm----------------------*)
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









