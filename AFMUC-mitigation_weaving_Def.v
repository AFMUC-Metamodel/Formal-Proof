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
(*Load "C:\Users\shumaila.iqbal\OneDrive - Riphah International University\Documents\Ph.D research work\3. PhD dissertation\2. Metamodel\AFMUC_Verification.v".*)
(******************)
Record WovenAFMUC : Set := {
  aspect_mitigation_name : string;
  mitigation_pointcut : (string * string);
  mitigation_joinpoints : (list SeqString * string);
  advice : AdviceType;
  mitigation_precondition : list SeqString;
  mitigation_behaviour : list SeqString;
  mitigation_postcondition : list SeqString
}.
Definition weaving
  (pc: Pointcut) 
  (muc: AspectMisUsecaseModule.Threat) 
  (aspect: AspectMitigationModule.Mitigation) : WovenAFMUC :=
  let mitigation_name := aspect.(AspectMitigationModule.aspect_mitigation_name) in
  let pointcut_info := (pointcut_name pc, "selection constraint applied") in
  let jp := apply_pointcut pc muc in
  let joinpoints_info := (jp.(selected_joinpoints), jp.(source_info)) in
  let advice_type :=
    match jp.(source_info) with
    | "basicthreatFlow" => Around
    | "Precondition" => Before
    | "Postcondition" => After
    | _ => Unknown
    end in
  let advice_behaviour := aspect.(AspectMitigationModule.basicmitigationFlow) in
  let precondition := aspect.(AspectMitigationModule.precondition) in
  let postcondition := aspect.(AspectMitigationModule.postcondition) in
  {| 
    aspect_mitigation_name := mitigation_name;
    mitigation_pointcut := pointcut_info;
    mitigation_joinpoints := joinpoints_info;
    advice := advice_type;
    mitigation_precondition := precondition;    
    mitigation_behaviour := advice_behaviour;
    mitigation_postcondition := postcondition
  |}.
Fixpoint weave_all (pcs : list Pointcut) (mucs : list AspectMisUsecaseModule.Threat) (aspect : AspectMitigationModule.Mitigation) : list WovenAFMUC :=
  match pcs, mucs with
  | pc :: pcs', muc :: mucs' => weaving pc muc aspect :: weave_all pcs' mucs' aspect
  | _, _ => nil
  end.











