**********************************************************************************************************************************************************
				AFMUC- Aspect-oriented MisUse Case Metamodel								
					     Formal Verification and Validation									
**********************************************************************************************************************************************************
This repository implements the AFMUC Metamodel in Coq IDE version 8.18. It includes class definitions, instances, lemma verification, weaving algorithms, and validation results.
The COQ code files (.v) Dependency Structure are as follows

		├── AFMUC_Lemma_Verification.v
		│   ├── depends on → AFMUC_Threat_Definition.v
		│   └── depends on → AFMUC_Threat_Instances.v
		│
		└── AFMUC_Threat_Validation.v
		    ├── depends on → AFMUC_weaving_algorithm.v
		    │   └── depends on → AFMUC_Threat_Definition.v
		    └── depends on → AFMUC_Threat_Instances.v

File/Folder		Name					Description															Dependencies

code File	AFMUC_Threat_Definition.v	Core metamodel: classes, attributes, and association functions		None

code File	AFMUC_Threat_Instances.v	Case study instances: use cases, misuse cases, aspects				None 

code File	AFMUC_Lemma_Verification.v	Lemma proofs and generates verification results						Load AFMUC_Threat_Definition.v 																																			Load AFMUC_Threat_Instances.v 

code File	AFMUC_weaving_algorithm.v	Weaving algorithm definition										Load AFMUC_Threat_Definition.v 

code File	AFMUC_Threat_Validation.v	Final woven model for validation of metamodel						Load AFMUC_weaving_algorithm.v
																											Load AFMUC_Threat_Instances.v, 				
Folder		threat verification results/	Generated verification results									Output of AFMUC_Lemma_Verification.v
Folder		threat validation results/	Generated validation results										Output of AFMUC_Threat_Validation.v

To execute any file in this project, its dependency file(s) must be referenced at the beginning of the code, typically after the library import statements. This ensures that all required definitions, instances, and functions are available before the main code is executed.

AFMUC MISUSE CASE METAMODEL
	This folder contains the AFMUC misuse case metamodel, which has been formally verified and validated in this project. The metamodel is represented 		using a UML 2.5.1  profile and related diagram files.
	Files Included
		•AFMUC_M_Threataspect.profile.uml
			Contains the main UML profile definition of the AFMUC misuse case metamodel.
		•AFMUC_M_Threataspect.profile.notation
			Stores the diagram notation and visual layout information for the UML profile.
		•AFMUC_M_Threataspect.profile.di
			Maintains the diagram interchange information used by the modeling tool.
		•Profile_AFMUC_M_Threataspect_Profile_Diagram
			Represents the profile diagram showing stereotypes and extensions of the metamodel.
	These files can be opened using UML modeling tools such as Eclipse Papyrus version 6.1.0 to view the AFMUC misuse case metamodel and its profile 		diagrams.
 
EXECUTION INSTRUCTIONS
	The instructions below explain how to execute the project files.
		STEP 1 – Clone the repository or download the files
				git clone <repository_url>

		STEP 2 – Open the project
				Open the cloned project folder using CoqIDE or VS Code with the Coq extension (VSCoq).

		STEP 3 – Ensure the following files are present in the folder
				Make sure the following project files exist in the repository or local folder in your system AFMUC_Threat_Definition.v
					AFMUC_Threat_Instances.v
					AFMUC_Lemma_Verification.v
					AFMUC_weaving_algorithm.v
					AFMUC_Threat_Validation.v
				Additional folders may contain generated results for reference:
					threat verification results/
					threat validation results/

		STEP 4- Execute the Lemma Verification code file
				The file “AFMUC_Lemma_Verification.v” contains the formal lemmas and proofs and defined instances to produce the result.
				Required Dependencies
					The verification file depends on the following two files:
						•AFMUC_Threat_Definition.v – contains the AFMUC metamodel definitions (classes, attributes, and association)
						•AFMUC_Threat_Instances.v – contains the EU-Rent case study instances (use cases, misuse cases,and aspects).
				Load command
				To execute this file, the required dependencies must be defined at the beginning of the code after Import libraries commands 				using the Load Command.
					Load "path_to_project/AFMUC_Threat_Definition.v".
					Load "path_to_project/AFMUC_Threat_Instances.v".
					**Replace path_to_project with the directory where the project files are in your system

		STEP 5- Executing the Validation code file
				This file AFMUC_Threat_Validation.v.  performs the final validation of the metamodel using the defined instances and weaving 				algorithm. To execute the model validation, open and compile:
					AFMUC_Threat_Validation.v
				To execute this file, the required dependencies must be defined at the beginning of the code after Import libraries commands 				using the Load command.
				Required Dependencies
					The validation file depends on the following two files:
						•AFMUC_weaving_algorithm.v- contains the definition of weaving algorithm including classes, 						attributes,functions and lemmas to proof weaving.						
						•AFMUC_Threat_Instances.v – contains the EU-Rent case study instances (use cases, misuse cases,and aspects).
				Load Command
				To execute this file, the required dependencies must be defined at the beginning of the code after Import libraries commands 				using the Load Command.
					Load "path_to_project/AFMUC_weaving_algorithm.v".
					Load "path_to_project/AFMUC_Threat_Instances.v".
					**Replace path_to_project with the directory where the project files are in your system

OUTPUT OF THE CODE

	After running the files:

		•Verification results are generated from lemma proofs, confirm each function that is formally verified is giving output result as expected.
		•Validation results and generated as woven model, confirm whether the EU-Rent instances satisfy the AFMUC metamodel.

	The reference outputs can be found in Folders:
		threat verification results/
		threat validation results/



