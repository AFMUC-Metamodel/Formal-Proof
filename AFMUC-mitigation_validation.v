Require Import String. 
Require Import List. 
Import ListNotations.
Require Import Arith.    
Open Scope string_scope.
Require Import Coq.Strings.String. 
Require Import Coq.Bool.Bool. 
(*Follwing files are required dependencies that must be defined here*)
(*Replace path_to_project with the directory where the project files are in your system*)
Load "path_to_project/ AFMUC-mitigation_weaving_algorithm.v".
Load "path_to_project/ AFMUC_mitigation_instances.v".

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




 


