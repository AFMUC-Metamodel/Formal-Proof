**********************************************************************************************************************************************************
				AFMUC- Aspect-oriented Mitigation case Metamodel							
					     Formal Verification and Validation										
**********************************************************************************************************************************************************
This repository implements the AFMUC Metamodel in Coq IDE version 8.18. It includes class definitions, instances, lemma verification, weaving algorithms, and validation results.
The COQ code files (.v) Dependency Structure are as follows

		├── AFMUC_mitigation_lemma_verification.v
		│   ├── depends on → AFMUC_mitigation_definition.v
		│   └── depends on → AFMUC_mitigation_instances.v
		│
		└── AFMUC_mitigation_validation.v
		    ├── depends on → AFMUC_mitigation_weaving_algorithm.v
		    │   └── depends on → AFMUC_mitigation_definition.v
		    └── depends on → AFMUC_mitigation_instances.v

File/Folder		Name								Description														Dependencies

code File	AFMUC_mitigation_definition.v		Core metamodel: classes, attributes, and association functions	None

code File	AFMUC_mitigation_instances.v		Case study instances: misuse cases, mitigation cases, aspects	None 

code File	AFMUC_mitigation_lemma_verification.v	Lemma proofs and it generates verification results			Load AFMUC_mitigation_definition.v 																																		Load AFMUC_mitigation_instances.v 

code File	AFMUC_mitigation_weaving_algorithm.v	Weaving algorithm definitions								Load AFMUC_mitigation_definition.v

code File	AFMUC_mitigation_validation.v		Final validation results using instances and weaving	 		 Load AFMUC_mitigation_weaving_algorithm.v 																																Load AFMUC_mitigation_instances.v, 															
Folder		threat verification results/		Generated verification results								Output of AFMUC_mitigation_lemma_verification.v
Folder		threat validation results/		Generated validation results								Output of AFMUC_mitigation_validation.v

To execute any file in this project, its dependency file(s) must be referenced at the beginning of the code, typically after the library import statements. This ensures that all required definitions, instances, and functions are available before the main code is executed.

AFMUC MITIGATION METAMODEL:

	This folder contains the AFMUC mitigation case metamodel, which has been formally verified and validated in this project. The metamodel is 	represented using a UML 2.5.1  profile and related diagram files.
	Files Included
		•aspectmitigation.profile.uml
			Contains the main UML profile definition of the AFMUC mitigation case metamodel.
		•aspectmitigation.profile.notation
			Stores the diagram notation and visual layout information for the UML profile.
		•aspectmitigation.profile.di
			Maintains the diagram interchange information used by the modeling tool.
		•Profile_aspectmitigation_Profile_Diagram
			Represents the profile diagram showing stereotypes and extensions of the metamodel.
	These files can be opened using UML modeling tools such as Eclipse Papyrus version 6.1.0 to view the AFMUC mitigation case metamodel and its profile 		diagrams.
 
EXECUTION INSTRUCTIONS:
	The instructions below explain how to execute the project files.
		STEP 1 – Clone the repository or download the files
				git clone <repository_url>

		STEP 2 – Open the project
				Open the cloned project folder using CoqIDE or VS Code with the Coq extension (VSCoq).

		STEP 3 – Ensure the following files are present in the folder
				Make sure the following project files exist in the repository or local folder in your system AFMUC_Threat_Definition.v
					AFMUC_mitigation_Instances.v
					AFMUC_mitigation_lemma_verification.v
					AFMUC_mitigation_weaving_algorithm.v
					AFMUC_mitigation_Validation.v
				Additional folders may contain generated results for reference:
					threat verification results/
					threat validation results/

		STEP 4- Execute the Lemma Verification code file
				The file “AFMUC_mitigation_lemma_verification.v” contains the formal lemmas and proofs and defined instances to produce the 				result.
				Required Dependencies
					The verification file depends on the following two files:
						•AFMUC_mitigation_Definition.v – contains the AFMUC metamodel definitions (classes, attributes, and 						association)
						•AFMUC_mitigation_Instances.v – contains the EU-Rent case study instances (misuse cases, mitigation 						cases,and aspects).
				Load command
				To execute this file, the required dependencies must be defined at the beginning of the code after Import libraries commands 				using the Load Command.
					Load "path_to_project/AFMUC_mitigation_Definition.v".
					Load "path_to_project/AFMUC_mitigation_Instances.v".
					**Replace path_to_project with the directory where the project files are in your system

		STEP 5- Executing the Validation code file
				This file AFMUC_mitigation_validation.v.  performs the final validation of the metamodel using the defined instances and 				weaving algorithm. To execute the model validation, open and compile:
					AFMUC_mitigation_validation.v
				To execute this file, the required dependencies must be defined at the beginning of the code after Import libraries commands 				using the Load command.
				Required Dependencies
					The validation file depends on the following two files:
						•AFMUC_mitigation_weaving_algorithm.v- contains the definition of weaving algorithm including classes, 								attributes,functions and lemmas to proof weaving.
						•AFMUC_mitigation_instances.v – contains the EU-Rent case study instances (misuse cases, mitigation 								cases,and aspects).
						
				Load Command
				To execute this file, the required dependencies must be defined at the beginning of the code after Import libraries commands 				using the Load Command.
					Load "path_to_project/AFMUC_mitigation_weaving_algorithm.v".
					Load "path_to_project/AFMUC_mitigation_instances.v".
					**Replace path_to_project with the directory where the project files are in your system

OUTPUT OF CODE

	After running the files:

		•Verification results are generated from lemma proofs
		•Validation results confirm whether the EU-Rent instances satisfy the AFMUC metamodel constraints

	The reference outputs can be found in Folders:
		mitigation verification results/
		mitigation validation results/



