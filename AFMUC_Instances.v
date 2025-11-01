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
  (*Load "reference location of AFMUC_Definitions.v".*)
                               (*/////////////Use case \\\\\\\\\\\\\\\\\\*)

(*/////////////////////////DEFINITION OF STRING LISTS DATA (USECASES) /////////////////////////*)
(*use case 1: register customer*)
Definition UC1_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The customer initiates the registration URL." |};
    {| seq_num := 2; value := "The user is not an existing customer." |};
    {| seq_num := 3; value := "The customer has network connection." |}
  ].
Definition UC1_basicFlow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters the name to the system." |};
    {| seq_num := 2; value := "The customer enters the address to the system." |};
    {| seq_num := 3; value := "The customer set the date of birth on calendar." |};
    {| seq_num := 4; value := "The customer enters the driving license number to the system." |};
    {| seq_num := 5; value := "The customer selects the date of issue of driving license from calendar." |};
    {| seq_num := 6; value := "The customer selects the date of expiration of driving license from calendar." |};
    {| seq_num := 7; value := "The system VALIDATES THAT the information is correct." |};
    {| seq_num := 8; value := "The system shows welcome message to the customer." |}
  ].
Definition UC1_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The customer is registered." |};
    {| seq_num := 2; value := "The customer DATA is stored in the database with unique identifier." |}
  ].
(* use case 2: make reservation*)
Definition UC2_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The customer initiates the make reservation URL." |};
    {| seq_num := 2; value := "The customer is registered in the system." |};
    {| seq_num := 3; value := "The customer has network connection."|}
  ].
Definition UC2_basicflow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters customer ID in the system." |};
    {| seq_num := 2; value := "The system VALIDATES THAT the customer is not backlisted. " |};
    {| seq_num := 3; value := "The customer selects the desired period of reservation to the system." |};
    {| seq_num := 4; value := "The system VALIDATES THAT the desired period of reservation is correct." |};
    {| seq_num := 5; value := "The customer selects the pickup branch to the system." |};
    {| seq_num := 6; value := "The customer selects the drop off branch to the system." |};
    {| seq_num := 7; value := "The customer selects the visiting countries to the system." |};
    {| seq_num := 8; value := "The customer selects the car group to the system." |};
    {| seq_num := 9; value := "The customer selects the desired car model to the system."|};
    {| seq_num := 10; value := "IF the customer enters the credit card number, THEN the rental is guaranteed."|};
    {| seq_num := 11; value := "IF the customer is a member of the loyalty incentive scheme, THEN initiate INCLUDED USE CASE offer points payment ELSE initiate INCLUDED USE CASE offer special advantages." |};
    {| seq_num := 12; value := "The customer confirms the rental." |};
    {| seq_num := 13; value := "The system creates a rental agreement." |}
  ].

Definition UC2_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "Rental agreement is generated." |};
    {| seq_num := 2; value := "The customer reservation DATA is stored in the database. " |};
    {| seq_num := 3; value := "The customer downloads the agreement" |}
  ].
(* use case 3: join loyalty scheme*)
Definition UC3_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The customer is registered in the system." |};
    {| seq_num := 2; value := "The customer initiates the join loyalty incentive scheme URL." |};
    {| seq_num := 3; value := "	The customer has network connection."|}
  ].
Definition UC3_basicflow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters customer ID in the system." |};
    {| seq_num := 2; value := "The system VALIDATES THAT the customer is not already a member of the scheme. " |};
    {| seq_num := 3; value := "The system VALIDATES THAT the customer has made 4 rentals within a year." |};
    {| seq_num := 4; value := "The system VALIDATES THAT the customer is qualified as a good experience. " |};
    {| seq_num := 5; value := "The customer accepts the membership." |};
    {| seq_num := 6; value := "The system changes the membership status of the customer." |};
    {| seq_num := 7; value := "The system accumulates the point for last 4 rentals to the customer." |}
  ].
Definition UC3_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The customer become a member of loyalty incentive scheme. " |};
    {| seq_num := 2; value := "The customer DATA is updated in the database with membership status. " |};
    {| seq_num := 3; value := "The customer DATA is updated with the total earned points in the database." |}
  ].

(* use case 4: cancel reservation*)
Definition UC4_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "Rental agreement is already generated." |};
    {| seq_num := 2; value := "The customer initiates the cancel reservation URL." |};
    {| seq_num := 3; value := "	The customer is registered in the system."|};
    {| seq_num := 4; value := "	The customer has network connection."|}
  ].
Definition UC4_basicflow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters customer ID in the system." |};
    {| seq_num := 2; value := "The customer selects the beginning date of reservation." |};
    {| seq_num := 3; value := "The system VALIDATES THAT the reservation exists." |};
    {| seq_num := 4; value := "The system VALIDATES THAT the reservation is in progress." |};
    {| seq_num := 5; value := "The customer confirms the cancellation of reservation." |};
    {| seq_num := 6; value := "The system VALIDATES THAT IF pickup day of rental is today THEN charging one day rental to the customer. " |};
    {| seq_num := 7; value := "The system updates the reservation with cancellation details." |}
  ].
Definition UC4_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The customer reservation status is updated with cancel in database " |};
    {| seq_num := 2; value := "The Rental agreement is cancelled. " |}
  ].

(* use case 5: extend rental agreement*)
Definition UC5_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "Rental agreement is already generated." |};
    {| seq_num := 2; value := "The customer initiates the extend rental agreement URL." |};
    {| seq_num := 3; value := "	The customer is registered in the system."|};
    {| seq_num := 4; value := "	The customer has network connection."|}
  ].
Definition UC5_basicflow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters customer ID in the system." |};
    {| seq_num := 2; value := "The customer selects the current rental agreement. " |};
    {| seq_num := 3; value := "The system VALIDTAED THAT no maintenance of car is required." |};
    {| seq_num := 4; value := "The system VALIDATES THAT extension is possible. " |};
    {| seq_num := 5; value := "The customer confirms the rental changes." |};
    {| seq_num := 6; value := "The system updates the rental agreement." |}
  ].
Definition UC5_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "Rental agreement is extended." |};
    {| seq_num := 2; value := "The customer reservation DATA is update in database with extended date. " |}
  ].

(* use case 6: Return car*)
Definition UC6_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The customer initiates the return car URL." |};
    {| seq_num := 2; value := "The customer is registered in the system." |};
    {| seq_num := 3; value := "Rental agreement is already generated."|};
    {| seq_num := 4; value := "The customer has network connection."|}
  ].
Definition UC6_basicflow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters customer ID in the system." |};
    {| seq_num := 2; value := "The customer selects the beginning date of rental. " |};
    {| seq_num := 3; value := "The system VALIDATES THAT IF the rental exists THEN stores actual time as return time." |};
    {| seq_num := 4; value := "The system VALIDATES THAT the car is returned to agreed drop-off branch." |};
    {| seq_num := 5; value := "The system VALIDATES THAT the car is returned on time." |};
    {| seq_num := 6; value := "The system calculates the basic cost of the rental up to the duration according to car group." |};
    {| seq_num := 7; value := "The system initiates INCLUDED USE CASE calculate best price." |};
    {| seq_num := 8; value := "IF car damages are found in car, THEN system initiates the EXTENDED BY USE CASE cancel all reservations." |};
    {| seq_num := 9; value := "TThe system shows the total cost to the customer." |};
    {| seq_num := 10; value := "The customer enters the credit card number to pay the rental to the system." |};
    {| seq_num := 11; value := "The system shows the thankyou message to the customer." |}
].
Definition UC6_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "The system updates the car return status in database." |};
    {| seq_num := 2; value := "The system updates the car maintenance details in the database. " |};
    {| seq_num := 3; value := "The system updates the customer experience in the database. " |}
  ].

(* use case 7: Cancel Membership*)
Definition UC7_precondition :  list SeqString :=
  [ {| seq_num := 1; value := "The customer initiates the cancel membership URL." |};
    {| seq_num := 2; value := "The customer is registered in the system." |};
    {| seq_num := 3; value := "The customer is a member of loyalty incentive scheme."|};
    {| seq_num := 4; value := "The customer has network connection."|}
  ].
Definition UC7_basicflow : list SeqString :=
  [ {| seq_num := 1; value := "The customer enters customer ID in the system." |};
    {| seq_num := 2; value := "The customer cancels the membership. " |};
    {| seq_num := 3; value := "The system changes the membership status of the customer." |};
    {| seq_num := 4; value := "The system removes the points of the customer." |}
  ].
Definition UC7_postcondition : list SeqString :=
  [ {| seq_num := 1; value := "Membership is cancelled.  " |};
    {| seq_num := 2; value := "All existing offer points or special advantages are discarded from database." |};
    {| seq_num := 3; value := "The customer membership status is updated in database." |}
  ].
(*/////////////////////////use case description instances/////////////////////////*)

(* Use case 1: Register Customer*)
Definition UC1: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := "register customer ";
  UsecaseModule.dependency := [];
  UsecaseModule.precondition := UC1_precondition;
  UsecaseModule.basicFlow:= UC1_basicFlow;
  UsecaseModule.postcondition:= UC1_postcondition;
|}.
(* Use case 2: Make Reservation*)
Definition UC2: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := "make reservation ";
  UsecaseModule.dependency := ["INCLUDED USE CASE offer points payment ";"INCLUDED USE CASE offer special advantages"];
  UsecaseModule.precondition := UC2_precondition;
  UsecaseModule.basicFlow:= UC2_basicflow; 
  UsecaseModule.postcondition:= UC1_postcondition;
|}.
(* Use case 3: Join loyalty scheme*)
Definition UC3: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := "join loyalty scheme";
  UsecaseModule.dependency := [];
  UsecaseModule.precondition := UC3_precondition;
  UsecaseModule.basicFlow:= UC3_basicflow;
  UsecaseModule.postcondition:= UC3_postcondition;
|}.
(* Use case 4: cancel reservation*)
Definition UC4: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := " cancel reservation ";
  UsecaseModule.dependency := [];
  UsecaseModule.precondition := UC4_precondition;
  UsecaseModule.basicFlow:= UC4_basicflow; 
  UsecaseModule.postcondition:= UC4_postcondition;
|}.
(* Use case 5: extend rental agreement*)
Definition UC5: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := "extend rental agreement";
  UsecaseModule.dependency := [];
  UsecaseModule.precondition := UC5_precondition;
  UsecaseModule.basicFlow:= UC5_basicflow;
  UsecaseModule.postcondition:= UC5_postcondition;
|}.
(* Use case 6: return car*)
Definition UC6: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := "return car";
  UsecaseModule.dependency := ["INCLUDED USE CASE CALCULATE BEST PRICE ";"INCLUDED USE CASE CANCEL ALL RESERVATIONS"];
  UsecaseModule.precondition := UC6_precondition;
  UsecaseModule.basicFlow:= UC6_basicflow; 
  UsecaseModule.postcondition:= UC6_postcondition;
|}.
(* Use case 7: cancel membership*)
Definition UC7: UsecaseModule.Usecase :={|
  UsecaseModule.uc_name  := "cancel membership";
  UsecaseModule.dependency := [];
  UsecaseModule.precondition := UC7_precondition;
  UsecaseModule.basicFlow:= UC7_basicflow; 
  UsecaseModule.postcondition:= UC7_postcondition;
|}.

(***************************************************************************)
                            (*/////////////Aspect Threats \\\\\\\\\\\\\\\\\\*)

(*/////////////aspect threat instances list of strings \\\\\\\\\\\\\\\\\\*)

(*aspectmisuse case 1: Get unauthorized access via SQLi *)
Definition AspectMUC1_precondition :  list SeqString :=
 [ {| seq_num := 1; value := "System has at least one registered user." |};
    {| seq_num := 2; value := "The system's network security is inadequate for detecting spoofed IP addresses" |}  
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
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP addresses."|}
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
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP addresses"|}
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
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP addresses"|}
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
    {| seq_num := 3; value := "The system's network security is inadequate for detecting spoofed IP addresses"|}
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


(*///////////////////////// Aspect threat description instances/////////////////////////*)

(* Aspect1: Get Unauthorized Access Via Sqli*)
Definition aspect1 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name := "Get unauthorized access via SQLi ";
  AspectMisUsecaseModule.precondition := AspectMUC1_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC1_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC1_postcondition;
|}. 
 
(* Aspect2: Intercept communication via SSL stripping *)
Definition aspect2 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name  := "Intercept communication via SSL stripping";
  AspectMisUsecaseModule.precondition := AspectMUC2_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC2_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC2_postcondition;
|}.
(* Aspect3: Modify persistent data via IDOR*)
Definition aspect3 : AspectMisUsecaseModule.Threat:={|
  AspectMisUsecaseModule.aspectmuc_name := "Modify persistent data via IDOR";
  AspectMisUsecaseModule.precondition := AspectMUC3_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC3_basicthreatflow;
  AspectMisUsecaseModule.postcondition:= AspectMUC3_postcondition;
|}.
(* Aspect4: Mask a page*)
Definition aspect4 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name  := "Mask a page";
  AspectMisUsecaseModule.precondition := AspectMUC4_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC4_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC4_postcondition;
|}.
(* Aspect5: Create malicious ads*)
Definition aspect5 : AspectMisUsecaseModule.Threat :={|
  AspectMisUsecaseModule.aspectmuc_name := "Create malicious ads";
  AspectMisUsecaseModule.precondition := AspectMUC5_precondition;
  AspectMisUsecaseModule.basicthreatFlow:= AspectMUC5_basicthreatflow ;
  AspectMisUsecaseModule.postcondition:= AspectMUC5_postcondition;
|}.
(*****************************************************************************)

(*/////////////Pointcut Instances \\\\\\\\\\\\\\\\\\*)

(* Basic Flow*)
Definition Pointcut1: Pointcut:={|
  pointcut_name:="register customer";
  pointcut_element:= fun uc => get_usecase_attribute uc "basicFlow"; 
  selection_constraint:= fun seq_str => match_constraint "customer enters" seq_str
|}.

Definition Pointcut2: Pointcut:={|
  pointcut_name:="make reservation";
  pointcut_element:= fun uc => get_usecase_attribute uc "basicFlow"; 
  selection_constraint:= fun seq_str => match_constraint "customer enters" seq_str
|}.
Definition Pointcut3: Pointcut:={|
  pointcut_name:="join loyalty scheme";
  pointcut_element:= fun uc => get_usecase_attribute uc "basicFlow"; 
  selection_constraint:= fun seq_str => match_constraint "customer enters" seq_str
|}.
(*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*)
(* Precondition*)
Definition Pointcut4: Pointcut:={|
  pointcut_name:="register customer";
  pointcut_element:= fun uc => get_usecase_attribute uc "precondition"; 
  selection_constraint:= fun seq_str => match_constraint "initiates the registration URL." seq_str
|}.

Definition Pointcut5: Pointcut:={|
  pointcut_name:="make reservation";
  pointcut_element:= fun uc => get_usecase_attribute uc "precondition"; 
  selection_constraint:= fun seq_str => match_constraint "initiates the make reservation URL" seq_str
|}.

Definition Pointcut6: Pointcut:={|
  pointcut_name:="join loyalty scheme";
  pointcut_element:= fun uc => get_usecase_attribute uc "precondition"; 
  selection_constraint:= fun seq_str => match_constraint "initiates the join loyalty" seq_str
|}.

Definition Pointcut7: Pointcut:={|
  pointcut_name:="return car";
  pointcut_element:= fun uc => get_usecase_attribute uc "precondition"; 
  selection_constraint:= fun seq_str => match_constraint "initiates the return car URL" seq_str
|}.

(*************************************************)


(* Postcondition*)
Definition Pointcut8:Pointcut:={|
  pointcut_name:="make reservation";
  pointcut_element:= fun uc => get_usecase_attribute uc "postcondition"; 
  selection_constraint:= fun seq_str => match_constraint "data" seq_str
|}. 

Definition Pointcut9: Pointcut:={|
  pointcut_name:="cancel membership";
  pointcut_element:= fun uc => get_usecase_attribute uc "postcondition"; 
  selection_constraint:= fun seq_str => match_constraint "data" seq_str
|}.
Definition Pointcut10:Pointcut:={|
  pointcut_name:="extend rental agreement";
  pointcut_element:= fun uc => get_usecase_attribute uc "postcondition"; 
  selection_constraint:= fun seq_str => match_constraint "data" seq_str
|}. 

Definition Pointcut11: Pointcut:={|
  pointcut_name:="return car";
  pointcut_element:= fun uc => get_usecase_attribute uc "postcondition"; 
  selection_constraint:= fun seq_str => match_constraint "data" seq_str
|}.


(*****************************************************************************)

(*/////////////Joinpoint Instances \\\\\\\\\\\\\\\\\\*)

Definition Joinpoint1 : Joinpoint :=
  let jp := apply_pointcut Pointcut1 UC1 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

Definition Joinpoint2 : Joinpoint :=
  let jp := apply_pointcut Pointcut2 UC2 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

Definition Joinpoint3 : Joinpoint :=
  let jp := apply_pointcut Pointcut3 UC3 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                  
  |}.

Definition Joinpoint4 : Joinpoint :=
  let jp := apply_pointcut Pointcut4 UC1 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

Definition Joinpoint5 : Joinpoint :=
  let jp := apply_pointcut Pointcut5 UC2 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

Definition Joinpoint6 : Joinpoint :=
  let jp := apply_pointcut Pointcut6 UC3 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.
Definition Joinpoint7 : Joinpoint :=
  let jp := apply_pointcut Pointcut7 UC6 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                  
  |}.

Definition Joinpoint8 : Joinpoint :=
  let jp := apply_pointcut Pointcut8 UC2 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

Definition Joinpoint9 : Joinpoint :=
  let jp := apply_pointcut Pointcut9 UC7 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

Definition Joinpoint10 : Joinpoint :=
  let jp := apply_pointcut Pointcut6 UC5 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.
Definition Joinpoint11 : Joinpoint :=
  let jp := apply_pointcut Pointcut11 UC6 in
  {|
    selected_joinpoints := jp.(selected_joinpoints);  
    source_info := jp.(source_info)                   
  |}.

(*****************************************************************************)

(*/////////////Advice instance\\\\\\\\\\\\\\\\\\*)
(*ASPECT 1: GET UNAUTHORIZED ACCESS*)

Definition advice1 : Advice :=
  let adv := apply_advice Joinpoint1 aspect1 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice2 : Advice :=
  let adv := apply_advice Joinpoint2 aspect1 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice3 : Advice :=
  let adv := apply_advice Joinpoint3 aspect1 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.

(*ASPECT 2: INTERCEPT COMMUNICATION*)

Definition advice4 : Advice :=
  let adv := apply_advice Joinpoint4 aspect2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice5 : Advice :=
  let adv := apply_advice Joinpoint5 aspect2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice6 : Advice :=
  let adv := apply_advice Joinpoint6 aspect2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice7 : Advice :=
  let adv := apply_advice Joinpoint7 aspect2 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
(***************************************************************************)
(*ASPECT 3: MODIFY DATA*)
Definition advice8 : Advice :=
  let adv := apply_advice Joinpoint8 aspect3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice9 : Advice :=
  let adv := apply_advice Joinpoint9 aspect3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice10 : Advice :=
  let adv := apply_advice Joinpoint10 aspect3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.
Definition advice11 : Advice :=
  let adv := apply_advice Joinpoint11 aspect3 in
  {| 
    advice_type := adv.(advice_type);
    threat_aspect := adv.(threat_aspect);
    advice_behaviour := adv.(advice_behaviour);
    target_joinpoints := adv.(target_joinpoints)
  |}.


(*****************************************************************************)

(*/////////////Introduction instance\\\\\\\\\\\\\\\\\\*)
(* Create a sample introduction *)

(* Define a list containing the use cases *)

(* Example introduction instance *) 

(*/////////////Introduction instance (REPLACE) \\\\\\\\\\\\\\\\\\*)

Definition intro1 := {| 
  introduction_name := "Mask a page";
  introduced_AT := fun substr usecases => filter_usecases_by_precondition substr usecases; (* Define the substring dynamically *)
  replace :=  fun substr threat usecases =>
    introduce_threat "Mask a page" substr threat usecases;                                  (* Directly use the string "Mask a page" *)
  introduced_AS:= default_introduced_AS;                                                    (* Default no-op for association *)
|}.

(*****************************************************************************)

(*/////////////Introduction instance (ASSOCIATE DEPENDENCY) \\\\\\\\\\\\\\\\\\*)
Definition usecaseslist := [UC1; UC2; UC3; UC7].
(* Example instance with a specific introduced_AS function *)
Definition intro2 := {|
  introduction_name := "Create Malicious Ads";
   introduced_AT := fun substr usecases => filter_usecases_by_precondition substr usecases;                 (* Define the substring dynamically *)
  replace := default_replace;                                                                               (* Use default_replace as a placeholder function *)
  introduced_AS := fun threat usecases => associate_threat_with_usecase "INCLUDED USECASE" threat usecases;
|}.
(* Example instance with a specific introduced_AS function *)
Definition intro3 := {|
  introduction_name := "Create Malicious Ads";
   introduced_AT := fun substr usecases => filter_usecases_by_precondition substr usecases; (* Define the substring dynamically *)
  replace := default_replace; (* Use default_replace as a placeholder function *)
  introduced_AS := fun threat usecases => associate_threat_with_usecase "EXTENDED BY USECASE" threat usecases;
|}.
(*****************************************************************************)

                                  (* ************* THE END**************** *)


