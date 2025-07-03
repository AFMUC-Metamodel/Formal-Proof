Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String.
Require Import Coq.Bool.Bool.
Load "C:\Users\shumaila.iqbal\OneDrive - Riphah International University\Documents\Ph.D research work\3. PhD dissertation\2. Metamodel\AFMUC_Definitions.v".
Load "C:\Users\shumaila.iqbal\OneDrive - Riphah International University\Documents\Ph.D research work\3. PhD dissertation\2. Metamodel\AFMUC_Instances.v".

(*******************Helper function proof*******************)
Lemma get_usecase_attribute_correct: 
  forall (uc: UsecaseModule.Usecase) (attribute_name: string),
  (attribute_name = "precondition" \/ attribute_name = "basicFlow" \/ attribute_name = "postcondition") ->
  get_usecase_attribute uc attribute_name =
  match attribute_name with
  | "precondition" => UsecaseModule.precondition uc
  | "basicFlow" => UsecaseModule.basicFlow uc
  | "postcondition" => UsecaseModule.postcondition uc
  | _ => nil 
  end.
Proof.
  intros uc attribute_name H.
  unfold get_usecase_attribute.
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
  forall (pc : Pointcut) (uc : UsecaseModule.Usecase),
  let attr_list := pointcut_element pc uc in
  let expected_source := get_source_attribute pc uc in
  let selected_elements := filter (selection_constraint pc) attr_list in
  apply_pointcut pc uc = Build_Joinpoint selected_elements expected_source.
Proof.
  intros pc uc.
  unfold apply_pointcut.
  simpl.
  reflexivity.
Qed. 

(*>>>>>>>>>>>>>>>>>>Main Function Proof (APPLY ADVICE)>>>>>>>>>>>>>>>>>>>>>>>>>>*)
Lemma apply_advice_correct (jp: Joinpoint) (aspect: AspectMisUsecaseModule.Threat) :
  let advice := apply_advice jp aspect in
  advice.(advice_type) = (match jp.(source_info) with
                         | "Basic Flow" => Around
                         | "Precondition" => Before
                         | "Postcondition" => After
                         | _ => Unknown
                         end)
  /\
    advice.(advice_behaviour) = AspectMisUsecaseModule.basicthreatFlow aspect
  /\
    advice.(target_joinpoints) = jp.(selected_joinpoints)
  /\
    advice.(threat_aspect) = aspect.(AspectMisUsecaseModule.aspectmuc_name).
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

(*******************Helper function proof*******************)
Lemma filter_usecases_by_precondition_correct :
  forall (substr: string) (usecases: list UsecaseModule.Usecase) (uc: UsecaseModule.Usecase),
    In uc (filter_usecases_by_precondition substr usecases) ->
    existsb (match_constraint substr) (UsecaseModule.precondition uc) = true.
Proof.
  intros substr usecases uc H.
  unfold filter_usecases_by_precondition in H.
  apply filter_In in H as [H_in H_existsb].
  exact H_existsb.
Qed.

(*******************Helper function proof*******************)
Lemma default_introduced_AS_correct:
  forall (threat: AspectMisUsecaseModule.Threat) (usecases: list UsecaseModule.Usecase),
    default_introduced_AS threat usecases = [].
Proof.
  intros threat usecases.
  unfold default_introduced_AS.
  reflexivity.
Qed.

(*******************Helper function proof*******************)

(*Lemma replace_usecase_correct:
  forall (threat: AspectMisUsecaseModule.Threat) (usecases: list UsecaseModule.Usecase),
    forall uc, In uc usecases ->
    (replace_usecase threat usecases) = 
    map (fun uc =>
      {|
        UsecaseModule.uc_name := UsecaseModule.uc_name uc;
        UsecaseModule.dependency := UsecaseModule.dependency uc;
        UsecaseModule.precondition := AspectMisUsecaseModule.precondition threat;
        UsecaseModule.basicFlow := AspectMisUsecaseModule.basicthreatFlow threat;
        UsecaseModule.postcondition := AspectMisUsecaseModule.postcondition threat
      |}) usecases.
Proof.
  intros threat usecases uc H. 
  simpl. reflexivity.
Qed.*)

(*>>>>>>>>>>>>>>>>>>Main Function Proof (INTRODUCED THREAT REPLACED THE USE CASE)>>>>>>>>>>>>>>>>>>>>>>>>>>*)
Lemma introduce_threat_correct:
  forall (intro_name: string) 
         (substr: string)
         (threat: AspectMisUsecaseModule.Threat)
         (usecases: list UsecaseModule.Usecase),
    introduce_threat intro_name substr threat usecases = 
    map (fun uc => (intro_name, 
                    {| UsecaseModule.uc_name := UsecaseModule.uc_name uc;
                       UsecaseModule.dependency := UsecaseModule.dependency uc;
                       UsecaseModule.precondition := AspectMisUsecaseModule.precondition threat;
                       UsecaseModule.basicFlow := AspectMisUsecaseModule.basicthreatFlow threat;
                       UsecaseModule.postcondition := AspectMisUsecaseModule.postcondition threat |}))
        (filter_usecases_by_precondition substr usecases).
Proof.
  intros intro_name substr threat usecases.
  unfold introduce_threat.
  simpl.
  rewrite map_map.
  reflexivity.
Qed.   
   
(*>>>>>>>>>>>>>>>>>>Main Function Proof (INTRODUCED THREAT ASSOCIATE TO USE CASE)>>>>>>>>>>>>>>>>>>>>>>>>>>*)
Lemma associate_threat_with_usecase_correct: 
  forall (association : string) (threat : AspectMisUsecaseModule.Threat) (usecases : list UsecaseModule.Usecase),
    let assoc_usecases := associate_threat_with_usecase association threat usecases in
    forall uc, In uc usecases ->
      exists assoc new_uc,
        In (assoc, new_uc, threat) assoc_usecases /\
        assoc = association /\ 
        new_uc.(UsecaseModule.dependency) = (association ++ " " ++ threat.(AspectMisUsecaseModule.aspectmuc_name)) :: uc.(UsecaseModule.dependency).
Proof.
  intros association threat usecases assoc_usecases uc H_in.
  unfold associate_threat_with_usecase in *.
  induction usecases as [|uc' usecases' IH].
  - simpl in H_in. contradiction. 
  - simpl in H_in.
    destruct H_in as [H_eq | H_in_tail].
    + subst uc'.
      exists association, 
        {|
          UsecaseModule.uc_name := UsecaseModule.uc_name uc;
          UsecaseModule.dependency := (association ++ " " ++ threat.(AspectMisUsecaseModule.aspectmuc_name)) :: UsecaseModule.dependency uc;
          UsecaseModule.precondition := UsecaseModule.precondition uc;
          UsecaseModule.basicFlow := UsecaseModule.basicFlow uc;
          UsecaseModule.postcondition := UsecaseModule.postcondition uc
        |}.
      split.
      * simpl. left. reflexivity. 
      * split.
        -- reflexivity. 
        -- reflexivity. 
    + specialize (IH H_in_tail) as [assoc' [new_uc' [H_in_assoc [H_assoc_eq H_dep_eq]]]].
      exists assoc', new_uc'.
      split.
      * simpl. right. assumption. 
      * split.
        -- assumption. 
        -- assumption.    
Qed.  








                                (* ************* THE END**************** *)











