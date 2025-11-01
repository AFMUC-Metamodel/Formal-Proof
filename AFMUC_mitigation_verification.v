Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String.
Require Import Coq.Bool.Bool.
Load "AFMUC_mitigation_definition.v".

(*******************Helper function proof*******************)
Lemma get_misusecase_attribute_correct: 
  forall (muc: AspectMisUsecaseModule.Threat) (attribute_name: string),
  (attribute_name = "precondition" \/ attribute_name = "basicthreatFlow" \/ attribute_name = "postcondition") ->
  get_misusecase_attribute  muc attribute_name =
  match attribute_name with
  | "precondition" => AspectMisUsecaseModule.precondition muc
  | "basicthreatFlow" => AspectMisUsecaseModule.basicthreatFlow muc
  | "postcondition" => AspectMisUsecaseModule.postcondition muc
  | _ => nil 
  end.
Proof.
  intros muc attribute_name H.
  unfold get_misusecase_attribute.
  destruct H as [Hpre | [Hbasic | Hpost]].
  - rewrite Hpre.
    reflexivity.
  - rewrite Hbasic.
    reflexivity.
  - rewrite Hpost. 
    reflexivity.
Qed.   
(*******************Helper function proof*******************)
Lemma match_constraint_correct :
  forall (substr: string) (seq_str: SeqString),
    contains_substring (value seq_str) substr = true ->
    match_constraint substr seq_str = true.
Proof.
  intros substr seq_str H.
  unfold match_constraint.
  destruct (string_dec (substring 0 (String.length substr) (value seq_str)) substr) as [H_eq | H_neq].
  - reflexivity.
  - rewrite H. reflexivity.
Qed.
 
(*>>>>>>>>>>>>>>>>>>Main Function Proof (APPLY POINTCUT)>>>>>>>>>>>>>>>>>>>>>>>>>>*)  

(*lemma for apply poincut function to get joinpoints*)
Lemma apply_pointcut_correct :
  forall (pc : Pointcut) (muc : AspectMisUsecaseModule.Threat),
  let attr_list := pointcut_element pc muc in
  let expected_source := get_source_attribute pc muc in
  let selected_elements := filter (selection_constraint pc) attr_list in
  apply_pointcut pc muc = Build_Joinpoint selected_elements expected_source.
Proof.
  intros pc muc.
  unfold apply_pointcut.
  simpl.
  reflexivity.
Qed. 

(*>>>>>>>>>>>>>>>>>>Main Function Proof (APPLY ADVICE)>>>>>>>>>>>>>>>>>>>>>>>>>>*)
Lemma apply_advice_correct (jp: Joinpoint) (aspect: AspectMitigationModule.Mitigation) :
  let advice := apply_advice jp aspect in
  advice.(advice_type) = (match jp.(source_info) with
                         | "basicthreatFlow" => Around
                         | "precondition" => Before
                         | "postcondition" => After
                         | _ => Unknown
                         end)
  /\
    advice.(advice_behaviour) = AspectMitigationModule.basicmitigationFlow aspect
  /\
    advice.(target_joinpoints) = jp.(selected_joinpoints)
  /\
    advice.(threat_aspect) = aspect.(AspectMitigationModule.aspect_mitigation_name).
Proof.
  unfold apply_advice.
    split.
  - destruct (jp.(source_info)); reflexivity.
  - split.
    + reflexivity.
    + split.
      * reflexivity.
      * reflexivity.
Qed.



                                (* ************* THE END**************** *)











