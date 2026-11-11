package com.gazuntite.input.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.command.history.assessment.diagnosis.LoadAcuteDiagnosisByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.assessment.diagnosis.LoadChronicDiagnosisByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.assessment.diagnosis.LoadResolvedDiagnosisByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.assessment.plan.followUp.LoadFollowUpByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.assessment.plan.labOut.LoadLabsByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.assessment.plan.recommendation.LoadRecommendationByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.assessment.treatment.LoadProcedureByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.dictationNote.LoadModuleDictationNoteByPatientIDCommand;
	import com.gazuntite.input.command.history.physical.ccHpi.LoadHPIByPatientIdPagedCommand;
	import com.gazuntite.input.command.history.physical.inHouseLab.LoadInHouseLabsByPatientIdPagedCommand;
	import com.gazuntite.input.command.visit.NoteDictation.LoadModuleDictationByVisitIdCommand;
	import com.gazuntite.input.command.visit.NoteDictation.LoadModuleNotesByVisitIdCommand;
	import com.gazuntite.input.command.visit.NoteDictation.ManageModuleDictationCommand;
	import com.gazuntite.input.command.visit.assessment.diagnosis.LoadPatientDiagnosisByVisitIdCommand;
	import com.gazuntite.input.command.visit.assessment.diagnosis.ManagePatientDiagnosisCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.GetPatientAllMedCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpByVisitIdCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpInstructionAgeTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpInstructionAgeValueTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpInstructionDurationTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpMethodTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpPatientLabTestTypesByPatientIdCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowUpServiceTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.LoadFollowupDataControlTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.followup.ManagePatientFollowUpCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LabTestOrderMethodTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadLIONICLabTestTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadLabPriorityTypeCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadLabSpecimenTypeStaticDataCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadLabTestTypeStaticDataCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadLabTypeStaticDataCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadPatientLabsByVisitCommand;
	import com.gazuntite.input.command.visit.assessment.plan.labout.ManagePatientLabsCommand;
	import com.gazuntite.input.command.visit.assessment.plan.recomendation.LoadAllRecommendationDurationTypesCommand;
	import com.gazuntite.input.command.visit.assessment.plan.recomendation.LoadAllRecommendationMethodTypesCommand;
	import com.gazuntite.input.command.visit.assessment.plan.recomendation.LoadAllRecommendationPlanTypesCommand;
	import com.gazuntite.input.command.visit.assessment.plan.recomendation.LoadPatientRecommendationByVisitIdCommand;
	import com.gazuntite.input.command.visit.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteCommand;
	import com.gazuntite.input.command.visit.assessment.plan.recomendation.ManagePatientRecommendationCommand;
	import com.gazuntite.input.command.visit.assessment.treatment.procedure.LoadProcedureByVisitIDCommand;
	import com.gazuntite.input.command.visit.assessment.treatment.procedure.ManagePatientProcedureCommand;
	import com.gazuntite.input.command.visit.physical.cchpi.LoadPatientHPIByVisitIdCommand;
	import com.gazuntite.input.command.visit.physical.cchpi.ManagePatientHPICommand;
	import com.gazuntite.input.command.visit.physical.cchpi.staticdata.LoadAllHPIDetailTypesCommand;
	import com.gazuntite.input.command.visit.physical.cchpi.staticdata.LoadHPIStaticDataCommand;
	import com.gazuntite.input.command.visit.physical.labin.LoadPatientInHouseLabsByVisitIdCommand;
	import com.gazuntite.input.command.visit.physical.labin.ManagePatientInHouseLabsCommand;
	import com.gazuntite.input.command.visit.physical.labin.staticData.LoadLabInStaticDataCommand;
	import com.gazuntite.input.command.visit.physical.physical.LoadPhysicalCategoryTypesCommand;
	import com.gazuntite.input.command.visit.physical.physical.LoadPhysicalsByPatientIdPagedCommand;
	import com.gazuntite.input.command.visit.physical.physical.ManagePatientPhysicalCommand;
	import com.gazuntite.input.command.visit.physical.ros.LoadROSByPatientIdPagedCommand;
	import com.gazuntite.input.command.visit.physical.ros.LoadROSCategoryTypesCommand;
	import com.gazuntite.input.command.visit.physical.ros.ManagePatientROSCommand;
	import com.gazuntite.input.command.visit.physical.vitals.LoadPatientPreviousVitalsCommand;
	import com.gazuntite.input.command.visit.physical.vitals.LoadPatientVitalByVisitCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.DeleteComprehensiveModuleDatabyPatientIDCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.LoadAllBloodRelationShipTypeDTOCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.LoadComhensiveHistoryStaticDataCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.LoadDiseaseTypesCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.LoadFamilyHistoryByPatientIdCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.LoadMedicalHistoryByPatientIdCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.LoadSocialHistoryByPatientIdCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.ManagePatientFamilyHistoryCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.ManagePatientSocialHistoryCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.ManagePatientSocialHistoryDeleteCommand;
	import com.gazuntite.input.command.visit.pmh.comphistory.SaveMedicalHistoryCommand;
	import com.gazuntite.input.command.visit.pmh.immunization.LoadImmunicationStaticDataCommand;
	import com.gazuntite.input.command.visit.pmh.immunization.LoadImmunizationByVisitIDCommand;
	import com.gazuntite.input.command.visit.pmh.immunization.ManagePatientImmunizationCommand;
	import com.gazuntite.input.command.visit.visit.CoSignVisitCommand;
	import com.gazuntite.input.command.visit.visit.CreateVisitCommand;
	import com.gazuntite.input.command.visit.visit.GenerateSoapNotePreviewCommand;
	import com.gazuntite.input.command.visit.visit.GetVisitChargesCommand;
	import com.gazuntite.input.command.visit.visit.LoadPhysiciansbyClinicBranchIDCommand;
	import com.gazuntite.input.command.visit.visit.LoadReviewHistroyCommand;
	import com.gazuntite.input.command.visit.visit.LoadVisitModuleTypesCommand;
	import com.gazuntite.input.command.visit.visit.ManageVisitOwnerCommand;
	import com.gazuntite.input.command.visit.visit.SaveReviewHistroyCommand;
	import com.gazuntite.input.command.visit.visit.SignVisitCommand;
	import com.gazuntite.input.command.visit.visit.VerifyUserCommand;
	import com.gazuntite.input.utils.QIConstants;

	public class QIController extends FrontController
	{
		private static var m_oQIController:QIController;
		
		public static function getInstance():QIController 
		{
			if ( m_oQIController == null )
				m_oQIController = new QIController( new Lock() );
			return m_oQIController;
		}
		
		public function QIController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
			
			addCommands();
		}
		
		public static const CREATE_NEW_VISIT: String = "CREATE_NEW_VISIT";
		public static const UPDATE_VISIT_EVENT:String = "UPDATE_VISIT_EVENT";

		public static const MANAGE_ROS 		 							: String =			"MANAGE_ROS";
		public static const LOAD_ROS_BY_PATIENT_ID_PAGED_EVENT			: String = 			"LOAD_ROS_BY_PATIENT_ID_PAGED_EVENT";
		public static const MANAGE_PHYSICAL 		 					: String =			"MANAGE_PHYSICAL";
		public static const LOAD_PHYSICALS_BY_PATIENT_ID_PAGED_EVENT	: String = 			"LOAD_PHYSICALS_BY_PATIENT_ID_PAGED_EVENT";
		
		public static const LOAD_COMHENSIVE_HISTORY_STATIC_DATA 		: String =			"LOAD_COMHENSIVE_HISTORY_STATIC_DATA_Obsolete"; //[05/27/2013] Shahid Munir to call this event from QScommon
		public static const LOAD_IMMUNICATION_STATIC_DATA 		 		: String =			"LOAD_IMMUNICATION_STATIC_DATA";
		
		public static const LOAD_LABIN_STATIC_DATA_EVENT 		 : String =					"LOAD_LABIN_STATIC_DATA_EVENT";
		public static const LOAD_LABIN_BY_VISIT_ID_EVENT 		 : String =					"LOAD_LABIN_BY_VISIT_ID_EVENT";
		public static const LOAD_HPI_STATIC_DATA_EVENT 			 : String =					"LOAD_HPI_STATIC_DATA_EVENT";
		public static const LOAD_ALL_HPI_DETAIL_TYPES_EVENT 	 : String =					"LOAD_ALL_HPI_DETAIL_TYPES_EVENT";
		public static const LOAD_ROS_CATEGORY_TYPES_EVENT 		 : String =					"LOAD_ROS_CATEGORY_TYPES_EVENT";
		public static const LOAD_PHYSICAL_CATEGORY_TYPES_EVENT 	 : String =					"LOAD_PHYSICAL_CATEGORY_TYPES_EVENT";
		//[07/02/2013] Shahid Munir, event moved to common
		//public static const LOAD_CPT_MEDICAL_TYPES_EVENT 		 : String = 				"LOAD_CPT_MEDICAL_TYPES_EVENT";
		public static const LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT : String =					"LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LAB_PRIORITY_STATIC_DATA_EVENT : String =					"LOAD_LAB_PRIORITY_STATIC_DATA_EVENT";
		public static const LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT : String =				"LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT : String =					"LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT : String =					"LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LIONIC_LAB_TEST_TYPE_EVENT : String =						"LOAD_LIONIC_LAB_TEST_TYPE_EVENT";
		public static const LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT : String =					"LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT";
		public static const LOAD_FOLLOW_UP_BY_VISIT_ID_EVENT : String =					"LOAD_FOLLOW_UP_BY_VISIT_ID_EVENT";
		
		public static const LOAD_PATIENT_MOST_RECENT_VITALS_EVENT : String =				"LOAD_PATIENT_MOST_RECENT_VITALS_EVENT";
		
		public static const LOAD_PATIENT_PREVIOUS_VITALS_EVENT : String =				"LOAD_PATIENT_PREVIOUS_VITALS_EVENT";
		public static const LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT : String =				"LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT";
		public static const LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT : String =	"LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT";
		public static const LOAD_PROCEDURE_BY_VISIT_ID_EVENT : String =				"LOAD_PROCEDURE_BY_VISIT_ID_EVENT";
		
		public static const LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT : String =				"LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT";
		public static const MANAGE_PATIENT_FAIMLY_HISTORY_EVENT : String =				"MANAGE_PATIENT_FAIMLY_HISTORY_EVENT";

		//[09/03/2013] Shahid Munir, moved to QS Common
		//public static const MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT : String =				"MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT";

		public static const LOAD_FOLLOW_UP_PATIENT_LAB_TEST_TYPES_BY_PATIENT_ID_EVENT:String = "LOAD_FOLLOW_UP_PATIENT_LAB_TEST_TYPES_BY_PATIENT_ID_EVENT";
		public static const LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT : String =		"LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT";
		public static const LOAD_FOLLOW_UP_METHOD_TYPE_EVENT : String =				"LOAD_FOLLOW_UP_METHOD_TYPE_EVENT";
		public static const LOAD_INSTRUCTION_AGE_TYPE_EVENT : String =				"LOAD_INSTRUCTION_AGE_TYPE_EVENT";
		public static const LOAD_PATIENT_ALL_MED_EVENT : String =					"LOAD_PATIENT_ALL_MED_EVENT";
		public static const LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT : String =		"LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT";
		public static const LOAD_INSTRUCTION_DURATION_TYPE_EVENT : String =			"LOAD_INSTRUCTION_DURATION_TYPE_EVENT";
		public static const LOAD_SERVICE_TYPE_EVENT : String =						"LOAD_SERVICE_TYPE_EVENT";
		
		public static const LOAD_ALL_DURATION_TYPES_EVENT : String =						"LOAD_ALL_DURATION_TYPES_EVENT";
		public static const LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT : String =			"LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT";
		public static const LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT : String =			"LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT";
		public static const LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT : String =		"LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT";
		
		//[07/04/2013] by Shahid Munir, moved to common
		//public static const LOAD_ICD_CODE_EVENT : String =							"LOAD_ICD_CODE_EVENT";
		public static const GET_VISIT_CHARGES_EVENT : String =							"GET_VISIT_CHARGES_EVENT";
		
		public static const LOAD_MEDICAL_HISTORY_EVENT : String =							"LOAD_MEDICAL_HISTORY_EVENT";
		public static const LOAD_FAMILY_HISTORY_EVENT : String =							"LOAD_FAMILY_HISTORY_EVENT";
		public static const LOAD_SOCIAL_HISTORY_EVENT : String =							"LOAD_SOCIAL_HISTORY_EVENT";
		public static const LOAD_DISEASE_TYPE_EVENT : String =							"LOAD_DISEASE_TYPE_EVENT";
		public static const LOAD_ALL_BLOOD_RELATIONSHIP_TYPE_DTO_EVENT : String =							"LOAD_ALL_BLOOD_RELATIONSHIP_TYPE_DTO_EVENT";
		
		public static const LOAD_PATIENT_HPI_BY_VISIT_EVENT : String = "LOAD_PATIENT_HPI_BY_VISIT_EVENT";
		public static const LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT : String =				"LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT";
		public static const LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT : String =				"LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT";
		public static const LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT : String =				"LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT";
		public static const MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT : String =				"MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT";
		
		public static const SAVE_MEDICAL_HISTORY_EVENT : String =							"SAVE_MEDICAL_HISTORY_EVENT";
		
		
		public static const MANAGE_PATIENT_IMMUNIZATION_EVENT : String =							"MANAGE_PATIENT_IMMUNIZATION_EVENT";
		//public static const MANAGE_PATIENT_VITALS_EVENT : String =							"MANAGE_PATIENT_VITALS_EVENT";
		
		public static const MANAGE_PATIENT_HPI_EVENT : String =							"MANAGE_PATIENT_HPI_EVENT";
		public static const MANAGE_PATIENT_LAB_IN_EVENT : String =							"MANAGE_PATIENT_LAB_IN_EVENT";
		
		public static const MANAGE_PATIENT_DIAGNOSIS_EVENT : String =							"MANAGE_PATIENT_DIAGNOSIS_EVENT";
		public static const MANAGE_PATIENT_PROCEDURE_EVENT : String =							"MANAGE_PATIENT_PROCEDURE_EVENT";
		public static const MANAGE_PATIENT_LABOUT_EVENT : String =							"MANAGE_PATIENT_LABOUT_EVENT";
		public static const MANAGE_PATIENT_RECOMMANDATION_EVENT : String =							"MANAGE_PATIENT_RECOMMANDATION_EVENT";
		public static const MANAGE_PATIENT_FOLLOW_UP_EVENT : String =							"MANAGE_PATIENT_FOLLOW_UP_EVENT";
		public static const MANAGE_PATIENT_SOCIAL_HISTORY_EVENT : String =							"MANAGE_PATIENT_SOCIAL_HISTORY_EVENT";
		public static const MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT:String = "MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT";
		
		public static const MANAGE_VISIT_OWNER_EVENT : String =							"MANAGE_VISIT_OWNER_EVENT";
		
		public static const MARK_VALID_DATA_EXISTS_EVENT : String =							"MARK_VALID_DATA_EXISTS_EVENT";
		
		
		public static const GENERATE_SOAP_NOTE_PREVIEW_EVENT 	: String =			"GENERATE_SOAP_NOTE_PREVIEW_EVENT";
		public static const VERIFY_USER_EVENT 	: String =			"VERIFY_USER_EVENT";
		public static const SIGN_VISIT_EVENT : String =								"SIGN_VISIT_EVENT";
		public static const CO_SIGN_VISIT_EVENT : String =								"CO_SIGN_VISIT_EVENT";
		public static const Load_Review_Histroy_Event : String =								"Load_Review_Histroy_Event";
		public static const Load_VISIT_MODULE_TYPE_Event : String =								"Load_VISIT_MODULE_TYPE_Event";
		
		public static const Save_Review_Histroy_Event : String =								"Save_Review_Histroy_Event";
		
		//[07/11/2013] Shahid Munir, event moved to QS Common
		//public static const LOAD_ENCOUNTER_TYPES_EVENT : String =			"LOAD_ENCOUNTER_TYPES_EVENT";
		public static const DELETE_COMPREHENSIVE_MODULE_EVENT: String = 				"DELETE_COMPREHENSIVE_MODULE_EVENT";
		public static const LOAD_PHYSICIANS_BY_CLINICBRANCH_ID: String = 				"LOAD_PHYSICIANS_BY_CLINICBRANCH_ID";
		
		/**Input history view events*/
		public static const LOAD_HPI_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_HPI_BY_PATIENT_ID_PAGED_EVENT";
		public static const LOAD_IN_HOUSE_LABS_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_IN_HOUSE_LABS_BY_PATIENT_ID_PAGED_EVENT";
		
		public static const LOAD_ACUTE_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_ACUTE_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT";
		public static const LOAD_CHRONIC_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_CHRONIC_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT";
		public static const LOAD_RESOLVED_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_RESOLVED_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT";
		
		public static const LOAD_PROCEDURE_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_PROCEDURE_BY_PATIENT_ID_PAGED_EVENT";
		
		public static const LOAD_LABS_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_LABS_BY_PATIENT_ID_PAGED_EVENT";
		public static const LOAD_RECOMMENDATION_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_RECOMMENDATION_BY_PATIENT_ID_PAGED_EVENT";
		public static const LOAD_FOLLOW_UP_BY_PATIENT_ID_PAGED_EVENT:String = "LOAD_FOLLOW_UP_BY_PATIENT_ID_PAGED_EVENT";
		
		public static const LOAD_MODULE_DICTATION_NOTE_BY_PATIENT_ID_EVENT:String = "LOAD_MODULE_DICTATION_NOTE_BY_PATIENT_ID_EVENT";
		
		protected function addCommands():void
		{
			addCommand(CREATE_NEW_VISIT, CreateVisitCommand);
			addCommand(GENERATE_SOAP_NOTE_PREVIEW_EVENT, GenerateSoapNotePreviewCommand);
			
			addCommand(MANAGE_ROS, ManagePatientROSCommand);
			addCommand(LOAD_ROS_BY_PATIENT_ID_PAGED_EVENT, LoadROSByPatientIdPagedCommand);
			addCommand(LOAD_PHYSICALS_BY_PATIENT_ID_PAGED_EVENT, LoadPhysicalsByPatientIdPagedCommand);
			addCommand(MANAGE_PHYSICAL, ManagePatientPhysicalCommand);
			
			addCommand(LOAD_COMHENSIVE_HISTORY_STATIC_DATA,LoadComhensiveHistoryStaticDataCommand);
			addCommand(LOAD_IMMUNICATION_STATIC_DATA,LoadImmunicationStaticDataCommand);
			addCommand(LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT,LoadImmunizationByVisitIDCommand);
			
			addCommand(LOAD_LABIN_STATIC_DATA_EVENT,LoadLabInStaticDataCommand);
			addCommand(LOAD_HPI_STATIC_DATA_EVENT, LoadHPIStaticDataCommand);
			addCommand(LOAD_ALL_HPI_DETAIL_TYPES_EVENT, LoadAllHPIDetailTypesCommand);
			addCommand(LOAD_ROS_CATEGORY_TYPES_EVENT, LoadROSCategoryTypesCommand);
			addCommand(LOAD_PHYSICAL_CATEGORY_TYPES_EVENT, LoadPhysicalCategoryTypesCommand);
			//[07/02/2013] Shahid Munir, event moved to common
			//addCommand(LOAD_CPT_MEDICAL_TYPES_EVENT, LoadCPTMedicalTypesCommand );
			addCommand(GET_VISIT_CHARGES_EVENT , GetVisitChargesCommand);
			addCommand(LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT , LoadLabTestTypeStaticDataCommand);
			addCommand(LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT , LoadLabSpecimenTypeStaticDataCommand);
			addCommand(LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT , LoadLabTypeStaticDataCommand);
			addCommand(LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT , LabTestOrderMethodTypeCommand);
			addCommand(LOAD_LAB_PRIORITY_STATIC_DATA_EVENT , LoadLabPriorityTypeCommand);
			addCommand(LOAD_LIONIC_LAB_TEST_TYPE_EVENT , LoadLIONICLabTestTypeCommand);
			addCommand(LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT , LoadPatientLabsByVisitCommand);
			
			
			addCommand(LOAD_FOLLOW_UP_PATIENT_LAB_TEST_TYPES_BY_PATIENT_ID_EVENT, LoadFollowUpPatientLabTestTypesByPatientIdCommand);
			addCommand(LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT , LoadFollowupDataControlTypeCommand);
			addCommand(LOAD_FOLLOW_UP_METHOD_TYPE_EVENT , LoadFollowUpMethodTypeCommand);
			addCommand(LOAD_INSTRUCTION_AGE_TYPE_EVENT , LoadFollowUpInstructionAgeTypeCommand);
			addCommand(LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT , LoadFollowUpInstructionAgeValueTypeCommand);
			addCommand(LOAD_INSTRUCTION_DURATION_TYPE_EVENT , LoadFollowUpInstructionDurationTypeCommand);
			addCommand(LOAD_SERVICE_TYPE_EVENT , LoadFollowUpServiceTypeCommand);
			
			
			addCommand(LOAD_ALL_DURATION_TYPES_EVENT , LoadAllRecommendationDurationTypesCommand);
			addCommand(LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT , LoadAllRecommendationMethodTypesCommand);
			addCommand(LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT , LoadAllRecommendationPlanTypesCommand);
			addCommand(LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT , LoadRecommendationLinksAutoCompleteCommand);
			addCommand(LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT , LoadPatientRecommendationByVisitIdCommand);
			
			//[07/04/2013] by Shahid Munir, moved to common
			//addCommand(LOAD_ICD_CODE_EVENT , LoadDiagnosisICDCodeCommand);
			addCommand(LOAD_MEDICAL_HISTORY_EVENT , LoadMedicalHistoryByPatientIdCommand);
			addCommand(LOAD_FAMILY_HISTORY_EVENT , LoadFamilyHistoryByPatientIdCommand);
			addCommand(LOAD_SOCIAL_HISTORY_EVENT , LoadSocialHistoryByPatientIdCommand);
			addCommand(LOAD_DISEASE_TYPE_EVENT , LoadDiseaseTypesCommand);
			addCommand(LOAD_ALL_BLOOD_RELATIONSHIP_TYPE_DTO_EVENT , LoadAllBloodRelationShipTypeDTOCommand);
			
			addCommand(LOAD_PATIENT_MOST_RECENT_VITALS_EVENT , LoadPatientVitalByVisitCommand);
			addCommand(LOAD_PATIENT_PREVIOUS_VITALS_EVENT , LoadPatientPreviousVitalsCommand);
			
			addCommand(LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT , LoadPatientHPIByVisitIdCommand);
			
			addCommand(SAVE_MEDICAL_HISTORY_EVENT , SaveMedicalHistoryCommand);
			
			addCommand(MANAGE_PATIENT_SOCIAL_HISTORY_EVENT , ManagePatientSocialHistoryCommand);
			addCommand(MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT, ManagePatientSocialHistoryDeleteCommand);
			addCommand(MANAGE_PATIENT_FAIMLY_HISTORY_EVENT , ManagePatientFamilyHistoryCommand);
			
			
			
			addCommand(LOAD_PATIENT_HPI_BY_VISIT_EVENT, LoadPatientHPIByVisitIdCommand);
			
			addCommand(MANAGE_PATIENT_IMMUNIZATION_EVENT , ManagePatientImmunizationCommand);
			//addCommand(MANAGE_PATIENT_VITALS_EVENT , ManagePatientVitalCommand);
			
			addCommand(MANAGE_PATIENT_HPI_EVENT , ManagePatientHPICommand);
			
			addCommand(MANAGE_PATIENT_DIAGNOSIS_EVENT , ManagePatientDiagnosisCommand);
			addCommand(MANAGE_PATIENT_PROCEDURE_EVENT , ManagePatientProcedureCommand);
			addCommand(MANAGE_PATIENT_LABOUT_EVENT , ManagePatientLabsCommand);
			
			addCommand(LOAD_LABIN_BY_VISIT_ID_EVENT , LoadPatientInHouseLabsByVisitIdCommand);
			addCommand(MANAGE_PATIENT_LAB_IN_EVENT , ManagePatientInHouseLabsCommand);
			addCommand(LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT , LoadPatientDiagnosisByVisitIdCommand);
			
			addCommand(LOAD_PROCEDURE_BY_VISIT_ID_EVENT , LoadProcedureByVisitIDCommand);
			addCommand(MANAGE_PATIENT_RECOMMANDATION_EVENT , ManagePatientRecommendationCommand);
			
			addCommand(LOAD_FOLLOW_UP_BY_VISIT_ID_EVENT , LoadFollowUpByVisitIdCommand);
			addCommand(MANAGE_PATIENT_FOLLOW_UP_EVENT , ManagePatientFollowUpCommand);
			
			
			addCommand(MANAGE_VISIT_OWNER_EVENT , ManageVisitOwnerCommand);
			
			//addCommand(MARK_VALID_DATA_EXISTS_EVENT , MarkValidDataExistsCommand);
			addCommand(VERIFY_USER_EVENT , VerifyUserCommand);
			addCommand(SIGN_VISIT_EVENT , SignVisitCommand);
			addCommand(CO_SIGN_VISIT_EVENT , CoSignVisitCommand);
			
			addCommand(Load_Review_Histroy_Event , LoadReviewHistroyCommand);
			addCommand(Save_Review_Histroy_Event , SaveReviewHistroyCommand);
			
			//[07/11/2013] Shahid Munir, event moved to QS Common
			//addCommand(LOAD_ENCOUNTER_TYPES_EVENT , LoadEncounterTypesCommand);
			addCommand(Load_VISIT_MODULE_TYPE_Event , LoadVisitModuleTypesCommand);
			addCommand(LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT , LoadModuleNotesByVisitIdCommand);
			
			//[09/03/2013] Shahid Munir, event moved to QS Common
			//addCommand(MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT , ManageModuleNotesCommand);
			
			addCommand(LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT , LoadModuleDictationByVisitIdCommand);
			addCommand(MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT , ManageModuleDictationCommand);
			addCommand(DELETE_COMPREHENSIVE_MODULE_EVENT , DeleteComprehensiveModuleDatabyPatientIDCommand);
			addCommand(LOAD_PHYSICIANS_BY_CLINICBRANCH_ID , LoadPhysiciansbyClinicBranchIDCommand);
			
			addCommand(LOAD_PATIENT_ALL_MED_EVENT , GetPatientAllMedCommand);
			
			addCommand(LOAD_IN_HOUSE_LABS_BY_PATIENT_ID_PAGED_EVENT, LoadInHouseLabsByPatientIdPagedCommand);
			addCommand(LOAD_HPI_BY_PATIENT_ID_PAGED_EVENT, LoadHPIByPatientIdPagedCommand);
			
			addCommand(LOAD_ACUTE_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT, LoadAcuteDiagnosisByPatientIdPagedCommand);
			addCommand(LOAD_CHRONIC_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT, LoadChronicDiagnosisByPatientIdPagedCommand);
			addCommand(LOAD_RESOLVED_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT, LoadResolvedDiagnosisByPatientIdPagedCommand);
			
			addCommand(LOAD_PROCEDURE_BY_PATIENT_ID_PAGED_EVENT, LoadProcedureByPatientIdPagedCommand);
			
			addCommand(LOAD_LABS_BY_PATIENT_ID_PAGED_EVENT, LoadLabsByPatientIdPagedCommand);
			addCommand(LOAD_RECOMMENDATION_BY_PATIENT_ID_PAGED_EVENT, LoadRecommendationByPatientIdPagedCommand);
			addCommand(LOAD_FOLLOW_UP_BY_PATIENT_ID_PAGED_EVENT, LoadFollowUpByPatientIdPagedCommand);
			
			addCommand(LOAD_MODULE_DICTATION_NOTE_BY_PATIENT_ID_EVENT, LoadModuleDictationNoteByPatientIDCommand);
		}
		
		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			QIConstants.RESTFULL_SERVICE_BASE_URL 	 = XmlUtils.getPropertyValueByName('RESTFUL_SERVICE_BASE_URL', value);
			QIConstants.EPRESCRIPTION_RESTFULSERVICE = XmlUtils.getPropertyValueByName('EPRESCRIPTION_RESTFULSERVICE', value);
			QIConstants.BILLING_RESTFUL_SERVICE 	 = XmlUtils.getPropertyValueByName('BILLING_RESTFUL_SERVICE', value);
		}
	}
}

class Lock
{
	//Singlton Lock
}