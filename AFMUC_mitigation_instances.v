(*Instance of EU- RENT a car use cases*)  
(* Import necessary libraries *)   
Require Import String.
Require Import List.
Import ListNotations.
Require Import Arith. 
Open Scope string_scope. 
(* Define a pair structure with a sequence number and a string *)
(*Record SeqString := {
  seq_num : nat;
  value : string
}.*)

Load "AFMUC_mitigation_definition.v". 

(*/////////////////////////DEFINITION OF STRING LISTS DATA SECTION 3/////////////////////////*)

(*/////////////////////////INSTANCES DEFINITION OF EU-RENT A CAR CASE STUDY SECTION 4/////////////////////////*)

(***************************************************************************)
(*aspectmisuse case 1: Get unauthorized access via SQLi *)
Definition AspectMUC1_precondition :  list SeqString :=
 [ {| seq_num := 1; value := "System has at least one registered user." |};
    {| seq_num := 2; value := "The system's network security is inadequate for detecting spoofed IP address" |}  
  ].
Definition AspectMUC1_basicthreatflow : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user PROVIDES SQLI VALUES IN input fields of the url." |};
    {| seq_num := 2; value := "The MALICIOUS user BYPASS the validation REQUEST TO server program." |};
    {| seq_num := 3; value := "The system executes the query provided in the url." |};
    {| seq_num := 4; value := "The system evaluates the query in the database." |};
    {| seq_num := 5; value := "The system VALIDATES THAT the query is successful." |};
    {| seq_num := 6; value := "The system SENDS the welcome message TO the MALICIOUS user." |}
  ].
Definition AspectMUC1_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The attacker successfully get unauthorized access  to the database" |}
  ].
    (* aspectmisuse case 2:Intercept communication via SSL stripping *)
Definition AspectMUC2_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The user application is not configured to enforce the use of HTTPS connection." |};
    {| seq_num := 2; value := "The MALCIOUS user positioned between the user and server in the network." |};
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP address."|}
  ].
Definition AspectMUC2_basicthreatflow : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user intercepts the initial connection attempt in the network." |};
    {| seq_num := 2; value := "The MALICIOUS user modifies the request with http connection." |};
    {| seq_num := 3; value := "The MALICOUS user forward the http request connection to server." |};
    {| seq_num := 4; value := "The MALICOUS user BYPASS the validation of http connection TO the server." |};
    {| seq_num := 5; value := "The system response with the http connection." |};
    {| seq_num := 6; value := "The MALICIOUS user intercepts the http connection response." |};
    {| seq_num := 7; value := "The MALICIOUS user modifies the http connection response." |};
    {| seq_num := 8; value := "The MALICIOUS user forwards the http connection response to the user." |};
    {| seq_num := 9; value := "The customer SEND sensitive DATA over the insecure http connection."|};
    {| seq_num := 10; value := "The MALCIOUS user intercept the customer DATA on the network"|}
  ].
Definition AspectMUC2_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user intercepts the user sensitive DATA without authorization." |}
  ].
   (* aspectmisuse case 3:Modify persistent data via IDOR *)
Definition AspectMUC3_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The data is stored in database." |};
    {| seq_num := 2; value := "The MALCIOUS user get unauthorized access to the database through network." |};
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP address"|}
  ].
Definition AspectMUC3_basicthreatflow : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user identifies the sensitive data in the system." |};
    {| seq_num := 2; value := "The MALICIOUS user GETS object reference id FROM the url." |};
    {| seq_num := 3; value := "The MALICIOUS user tamper with the object reference id." |};
    {| seq_num := 4; value := "The MALICIOUS user BYPASS the validation REQUEST TO the system." |};
    {| seq_num := 5; value := "The system VALIDATES THAT the url is valid." |};
    {| seq_num := 6; value := "The MALCIOUS user get access to the user DATA in database." |};
    {| seq_num := 7; value := "The MALICIOUS user reads the user DATA in database." |};
    {| seq_num := 8; value := "The MALCIOUS user modify the DATA in the database." |}
  ].
Definition AspectMUC3_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user modifies the persistent data in database." |}
  ].
    (* aspectmisuse case 4:Mask a page *)
Definition AspectMUC4_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The system follows insecure coding practices." |};
    {| seq_num := 2; value := "The system has misconfigurations." |};
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP address"|}
  ].
Definition AspectMUC4_basicthreatflow : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user crafts a payload with code snippet." |};
    {| seq_num := 2; value := "The MALICIOUS user EXPOLITES the code injection vulnerability of server." |};
    {| seq_num := 3; value := "The MALICIOUS user GETS code FROM the code repository." |};
    {| seq_num := 4; value := "The MALICIOUS user PROVIDES REC VALUES IN the server code." |};
    {| seq_num := 5; value := "the MALICIOUS user SENDS a MALICIOUS payload TO the server program." |};
    {| seq_num := 6; value := "The MALICIOUS code BYPASS the secure code validation REQUEST TO server." |};
    {| seq_num := 7; value := "The system VALIDATES THAT the payload is valid." |};
    {| seq_num := 8; value := "The MALCIOUS user modify the server code with desired content." |}
  ].
Definition AspectMUC4_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user successfully defaces the target website." |}
  ].
 (* aspectmisuse case 5: Create malicious ads *)
Definition AspectMUC5_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The system follows insecure coding practices." |};
    {| seq_num := 2; value := "The system has misconfigurations." |};
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP address"|}
  ].
Definition AspectMUC5_basicthreatflow : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user crafts a MALCIOUS ad with code snippet." |};
    {| seq_num := 2; value := "The MALICIOUS user EXPOLITES the code injection vulnerability of server." |};
    {| seq_num := 3; value := "The MALICIOUS user GETS code FROM the code repository." |};
    {| seq_num := 4; value := "The MALICIOUS user PROVIDES REC VALUES IN the server code." |};
    {| seq_num := 5; value := "the MALICIOUS user SENDS a MALICIOUS ad payload TO the server program." |};
    {| seq_num := 6; value := "The MALICIOUS ad BYPASS the secure code validation REQUEST TO server." |};
    {| seq_num := 7; value := "The system VALIDATES THAT the MALICIOUS ad is valid." |};
    {| seq_num := 8; value := "The system displays a MALICIOUS ad in the url." |}
  ].
Definition AspectMUC5_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The MALICIOUS user successfully creates a malicious ad in the system." |}
  ].

(*/////////////////////////INSTANCES DEFINITION OF EU-RENT A CAR CASE STUDY SECTION 4/////////////////////////*)

(* Aspect1: Get Unauthorized Access Via Sqli*)
Definition aspect1 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name := "Get unauthorized access via SQLi ";
  (*AspectMisUsecaseModule.threatens := threatens_usecases;:*)
  AspectMisUsecaseModule.precondition := AspectMUC1_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC1_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC1_postcondition;
|}. 
 
(* Aspect2: Intercept communication via SSL stripping *)
Definition aspect2 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name  := "Intercept communication via SSL stripping";
  (*AspectMisUsecaseModule.threatens := threatens_usecases;*)
  AspectMisUsecaseModule.precondition := AspectMUC2_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC2_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC2_postcondition;
|}.
(* Aspect3: Modify persistent data via IDOR*)
Definition aspect3 : AspectMisUsecaseModule.Threat:={|
  AspectMisUsecaseModule.aspectmuc_name := "Modify persistent data via IDOR";
  (*AspectMisUsecaseModule.threatens := threatens_usecases;*)
  AspectMisUsecaseModule.precondition := AspectMUC3_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC3_basicthreatflow;
  AspectMisUsecaseModule.postcondition:= AspectMUC3_postcondition;
|}.
(* Aspect4: Mask a page*)
Definition aspect4 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name  := "Mask a page";
  (*AspectMisUsecaseModule.threatens := threatens_usecases;*)
  AspectMisUsecaseModule.precondition := AspectMUC4_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC4_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC4_postcondition;
|}.
(* Aspect5: Create malicious ads*)
Definition aspect5 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name := "Create malicious ads";
  (*AspectMisUsecaseModule.threatens := threatens_usecases;*)
  AspectMisUsecaseModule.precondition := AspectMUC5_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC5_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC5_postcondition;
|}.
(*****************************************************************************)
(*Mitigation case 1: Validate input *)
Definition AspectMC1_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The system has received malicious script.." |}
  ]. 
   
Definition AspectMC1_basicmitigationFlow : list SeqString :=
  [ {| seq_num := 1; value := "The system sanitizes the inputs according to the input speciﬁcation." |};
    {| seq_num := 2; value := "The system VALIDATES THAT the inputs are valid" |}
  ].

Definition AspectMC1_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The system has successfully validated the inputs." |}
  ].

(*Mitigation case 2: Encrypt data *)
Definition AspectMC2_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "Identification of sensitive data that needs to be protected." |};
    {| seq_num := 2; value := "Selection of appropriate encryption algorithms and keys." |}
  ]. 
   
Definition AspectMC2_basicmitigationFlow : list SeqString :=
  [ {| seq_num := 1; value := "The system identifies the sensitive data entered by the user." |};
    {| seq_num := 2; value := "The system applies the encryption algorithm to secure the transmission of secure data." |};
    {| seq_num := 3; value := "The system applies the encryption algorithm on the data stored in database." |}
  ].

Definition AspectMC2_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "Sensitive data is encrypted." |}
  ].

(*Mitigation case 3: Monitor network*)
Definition AspectMC3_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The Intrusion Prevention (IPS) installed within the network infrastructure." |};
    {| seq_num := 2; value := "The network is operational and monitoring traffic." |}
  ]. 

Definition AspectMC3_basicmitigationFlow : list SeqString :=
  [ {| seq_num := 1; value := "The IPS continuously monitors incoming and outgoing network traffic, analysing packet headers and payload content. " |};
    {| seq_num := 2; value := "The system utilizes signature-based detection mechanisms within the IPS to match patterns of known traffic patterns." |};
    {| seq_num := 3; value := "IPS detect deviations from normal network behaviour." |};
    {| seq_num := 4; value := "IPS decrypt and inspect encrypted traffic." |};
    {| seq_num := 5; value := "IPS detect Address Resolution Protocol spoofing or MAC address anomalies within the network." |};
    {| seq_num := 6; value := "IPS generates real-time alerts or triggers predefined actions." |};
    {| seq_num := 7; value := "IPS isolate the affected segments of the network." |};
    {| seq_num := 8; value := "IPS block the malicious traffic." |}
  ].

Definition AspectMC3_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "Spoofed IP addresses are detected and mitigated." |};
    {| seq_num := 1; value := "The network remains secure from the intrusion attempt." |}
  ].


(*/////////////////////////INSTANCES DEFINITION OF EU-RENT A CAR CASE STUDY SECTION 4/////////////////////////*)

(* Mitigation 1: Validate Input*)
Definition AspectMC1 : AspectMitigationModule.Mitigation:={|
  AspectMitigationModule.aspect_mitigation_name := "Validate input";
  (*AspectMitigationModule.mitigates := ["Get unauthorized access via SQLi"];*)
  AspectMitigationModule.precondition := AspectMC1_precondition;
  AspectMitigationModule.basicmitigationFlow:= AspectMC1_basicmitigationFlow;
  AspectMitigationModule.postcondition:= AspectMC1_postcondition;
|}.
(* Mitigation 2: Encrypt data*)
Definition AspectMC2 : AspectMitigationModule.Mitigation:={|
  AspectMitigationModule.aspect_mitigation_name := "Encrypt data";
  (*AspectMitigationModule.mitigates := ["Get unauthorized access via SQLi";"Intercept communication via SSL stripping";"Modify persistent data via IDOR";"Mask a page";"Create malicious ads"];*)
  AspectMitigationModule.precondition := AspectMC2_precondition;
  AspectMitigationModule.basicmitigationFlow:= AspectMC2_basicmitigationFlow;
  AspectMitigationModule.postcondition:= AspectMC2_postcondition;
|}.
(* Mitigation 3: Monitor network*)
Definition AspectMC3 : AspectMitigationModule.Mitigation:={|
  AspectMitigationModule.aspect_mitigation_name := "Monitor Network";
  (*AspectMitigationModule.mitigates := ["Get unauthorized access via SQLi";"Intercept communication via SSL stripping";"Modify persistent data via IDOR";"Mask a page";"Create malicious ads"];*)
  AspectMitigationModule.precondition := AspectMC3_precondition;
  AspectMitigationModule.basicmitigationFlow:= AspectMC3_basicmitigationFlow;
  AspectMitigationModule.postcondition:= AspectMC3_postcondition;
|}.


(* POINTCUT instances*)
(* basic threat Flow-----validate input*)
Definition Pointcut1: Pointcut:={|
  pointcut_name:="Get unauthorized access via SQLi";
  pointcut_element:= fun muc => get_misusecase_attribute muc "basicthreatFlow"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "SQLI VALUES IN" seq_str
|}.

(* Precondition-----encrypt data*)
Definition Pointcut2: Pointcut:={|
  pointcut_name:="get unauthorized access via SQLI ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "registered user" seq_str
|}.
(* Basic Threat Flow----- encrypt data*)
Definition Pointcut3: Pointcut:={|
  pointcut_name:="intercept communication via SSL stripping ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "basicthreatFlow"; (* Changed to return list of SeqString *)
selection_constraint:= fun seq_str =>
    match_constraint "customer SEND " seq_str
|}.
(*precondition-----encrypt data*)
Definition Pointcut4: Pointcut:={|
  pointcut_name:="Modify persistent data via IDOR ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *) 
selection_constraint:= fun seq_str =>
    match_constraint "data is stored" seq_str
|}.

(* Precondition----- monitor network*)
Definition Pointcut5:Pointcut:={|
  pointcut_name:="get unauthorized access via SQLI ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "spoofed IP address" seq_str
|}. 

Definition Pointcut6: Pointcut:={|
  pointcut_name:="intercept communication via ssl stripping ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "MALCIOUS user positioned between the user and server" seq_str
|}.
Definition Pointcut7: Pointcut:={|
  pointcut_name:="modify persistent data via idor  ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "spoofed IP address" seq_str
|}.
Definition Pointcut8: Pointcut:={|
  pointcut_name:="mask a web page ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "spoofed IP address" seq_str
|}.
Definition Pointcut9: Pointcut:={|
  pointcut_name:="create malicious ads  ";
  pointcut_element:= fun muc => get_misusecase_attribute muc "precondition"; (* Changed to return list of SeqString *)
  selection_constraint:= fun seq_str =>
    match_constraint "spoofed IP address" seq_str
|}.


Definition Joinpoint1 : Joinpoint :=
  let jp := apply_pointcut Pointcut1 aspect1 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint2 : Joinpoint :=
  let jp := apply_pointcut Pointcut2 aspect1 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint3 : Joinpoint :=
  let jp := apply_pointcut Pointcut3 aspect2 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint4 : Joinpoint :=
  let jp := apply_pointcut Pointcut4 aspect3 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint5 : Joinpoint :=
  let jp := apply_pointcut Pointcut5 aspect1 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint6 : Joinpoint :=
  let jp := apply_pointcut Pointcut6 aspect2 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint7 : Joinpoint :=
  let jp := apply_pointcut Pointcut7 aspect3 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint8 : Joinpoint :=
  let jp := apply_pointcut Pointcut8 aspect4 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)
Definition Joinpoint9 : Joinpoint :=
  let jp := apply_pointcut Pointcut9 aspect5 in
  Build_Joinpoint (selected_joinpoints jp)  (* Extract selected_joinpoints *)
                  (source_info jp).         (* Extract source_info *)



(*/////////////Advice instance\\\\\\\\\\\\\\\\\\*)

Definition advice1 : Advice :=
  let adv := apply_advice Joinpoint1 AspectMC1 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice2 : Advice :=
  let adv := apply_advice Joinpoint2 AspectMC2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice3 : Advice :=
  let adv := apply_advice Joinpoint3 AspectMC2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice4 : Advice :=
  let adv := apply_advice Joinpoint4 AspectMC2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice5 : Advice :=
  let adv := apply_advice Joinpoint5 AspectMC3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice6 : Advice :=
  let adv := apply_advice Joinpoint6 AspectMC3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice7 : Advice :=
  let adv := apply_advice Joinpoint7 AspectMC3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice8 : Advice :=
  let adv := apply_advice Joinpoint8 AspectMC3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice9 : Advice :=
  let adv := apply_advice Joinpoint9 AspectMC3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.




