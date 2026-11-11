package com.gazuntite.patient.visit.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.patient.visit.command.NoteDictation.LoadModuleDictationByVisitIdCommand;
	import com.gazuntite.patient.visit.command.NoteDictation.LoadModuleNotesByVisitIdCommand;
	import com.gazuntite.patient.visit.command.NoteDictation.ManageModuleDictationCommand;
	import com.gazuntite.patient.visit.command.NoteDictation.ManageModuleNotesCommand;
	import com.gazuntite.patient.visit.command.assessment.diagnosis.LoadDiagnosisICDCodeCommand;
	import com.gazuntite.patient.visit.command.assessment.diagnosis.LoadPatientChronicDiagnosisByPatientIdCommand;
	import com.gazuntite.patient.visit.command.assessment.diagnosis.LoadPatientDiagnosisByVisitIdCommand;
	import com.gazuntite.patient.visit.command.assessment.diagnosis.ManagePatientDiagnosisCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.GetPatientAllMedCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowUpInstructionAgeTypesCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowUpInstructionAgeValueTypesCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowUpInstructionDurationTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowUpMergeByVisitIdCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowUpMethodTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowUpServiceTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.LoadFollowupDataControlTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.followup.ManagePatientFollowupMergedCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LabTestOrderMethodTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LoadLIONICLabTestTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LoadLabPriorityTypeCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LoadLabSpecimenTypeStaticDataCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LoadLabTestTypeStaticDataCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LoadLabTypeStaticDataCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.LoadPatientLabsByVisitCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.labout.ManagePatientLabsCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.recomendation.LoadAllRecommendationDurationTypesCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.recomendation.LoadAllRecommendationMethodTypesCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.recomendation.LoadAllRecommendationPlanTypesCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.recomendation.LoadPatientRecommendationByVisitIdCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteCommand;
	import com.gazuntite.patient.visit.command.assessment.plan.recomendation.ManagePatientRecommendationCommand;
	import com.gazuntite.patient.visit.command.assessment.treatment.procedure.LoadCPTMedicalTypesCommand;
	import com.gazuntite.patient.visit.command.assessment.treatment.procedure.LoadProcedureByVisitIDCommand;
	import com.gazuntite.patient.visit.command.assessment.treatment.procedure.ManagePatientProcedureCommand;
	import com.gazuntite.patient.visit.command.physical.cchpi.LoadPatientHPIByVisitIdCommand;
	import com.gazuntite.patient.visit.command.physical.cchpi.ManagePatientHPICommand;
	import com.gazuntite.patient.visit.command.physical.cchpi.staticdata.LoadAllHPIDetailTypesCommand;
	import com.gazuntite.patient.visit.command.physical.cchpi.staticdata.LoadHPIStaticDataCommand;
	import com.gazuntite.patient.visit.command.physical.labin.LoadPateintInHouseLabsByVisitIdCommand;
	import com.gazuntite.patient.visit.command.physical.labin.ManagePatientInHouseLabsCommand;
	import com.gazuntite.patient.visit.command.physical.labin.staticData.LoadLabInStaticDataCommand;
	import com.gazuntite.patient.visit.command.physical.physical.LoadPhysicalCategoryTypesCommand;
	import com.gazuntite.patient.visit.command.physical.physical.ManagePatientPhysicalCommand;
	import com.gazuntite.patient.visit.command.physical.ros.LoadROSCategoryTypesCommand;
	import com.gazuntite.patient.visit.command.physical.ros.ManagePatientROSCommand;
	import com.gazuntite.patient.visit.command.physical.vitals.LoadPatientPreviousVitalsCommand;
	import com.gazuntite.patient.visit.command.physical.vitals.LoadPatientVitalByVisitCommand;
	import com.gazuntite.patient.visit.command.physical.vitals.ManagePatientVitalCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.DeleteComprehensiveModuleDatabyPatientIDCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.LoadAllBloodRelationShipTypeDTOCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.LoadComhensiveHistoryStaticDataCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.LoadDiseaseTypesCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.LoadFamilyHistoryByPatientIdCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.LoadMedicalHistoryByPatientIdCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.LoadSocialHistoryByPatientIdCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.ManagePatientFamilyHistoryCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.ManagePatientSocialHistoryCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.ManagePatientSocialHistoryDeleteCommand;
	import com.gazuntite.patient.visit.command.pmh.comphistory.SaveMedicalHistoryCommand;
	import com.gazuntite.patient.visit.command.pmh.immunization.LoadImmunicationStaticDataCommand;
	import com.gazuntite.patient.visit.command.pmh.immunization.LoadImmunizationByVisitIDCommand;
	import com.gazuntite.patient.visit.command.visit.CreateVisitCommand;
	import com.gazuntite.patient.visit.command.visit.GenerateSoapNotePreviewCommand;
	import com.gazuntite.patient.visit.command.visit.LoadEncounterTypesCommand;
	import com.gazuntite.patient.visit.command.visit.LoadPhysiciansbyClinicBranchIDCommand;
	import com.gazuntite.patient.visit.command.visit.LoadReviewHistroyCommand;
	import com.gazuntite.patient.visit.command.visit.LoadVisitModuleTypesCommand;
	import com.gazuntite.patient.visit.command.visit.ManageVisitOwnerCommand;
	import com.gazuntite.patient.visit.command.visit.MarkValidDataExistsCommand;
	import com.gazuntite.patient.visit.command.visit.SaveReviewHistroyCommand;
	import com.gazuntite.patient.visit.utils.QIConstants;

	public class QIController extends FrontController
	{
		public static const CREATE_NEW_VISIT:String = "CREATE_NEW_VISIT";

		public static const MANAGE_ROS:String = "MANAGE_ROS";
		public static const MANAGE_PHYSICAL:String = "MANAGE_PHYSICAL";
		
		public static const LOAD_COMHENSIVE_HISTORY_STATIC_DATA:String = "LOAD_COMHENSIVE_HISTORY_STATIC_DATA";
		public static const LOAD_IMMUNICATION_STATIC_DATA:String = "LOAD_IMMUNICATION_STATIC_DATA";
		
		public static const LOAD_LABIN_STATIC_DATA_EVENT:String = "LOAD_LABIN_STATIC_DATA_EVENT";
		public static const LOAD_LABIN_BY_VISIT_ID_EVENT: String = "LOAD_LABIN_BY_VISIT_ID_EVENT";
		public static const LOAD_HPI_STATIC_DATA_EVENT:String = "LOAD_HPI_STATIC_DATA_EVENT";
		public static const LOAD_ALL_HPI_DETAIL_TYPES_EVENT:String = "LOAD_ALL_HPI_DETAIL_TYPES_EVENT";
		public static const LOAD_ROS_CATEGORY_TYPES_EVENT:String = "LOAD_ROS_CATEGORY_TYPES_EVENT";
		public static const LOAD_PHYSICAL_CATEGORY_TYPES_EVENT:String =	"LOAD_PHYSICAL_CATEGORY_TYPES_EVENT";
		public static const LOAD_CPT_MEDICAL_TYPES_EVENT:String = "LOAD_CPT_MEDICAL_TYPES_EVENT";
		public static const LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT:String = "LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LAB_PRIORITY_STATIC_DATA_EVENT:String = "LOAD_LAB_PRIORITY_STATIC_DATA_EVENT";
		public static const LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT:String = "LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT:String = "LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT:String = "LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT";
		public static const LOAD_LIONIC_LAB_TEST_TYPE_EVENT:String = "LOAD_LIONIC_LAB_TEST_TYPE_EVENT";
		public static const LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT:String = "LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT";
		public static const LOAD_FOLLOW_UP_MERGE_BY_VISIT_ID_EVENT:String =	"LOAD_FOLLOW_UP_MERGE_BY_VISIT_ID_EVENT";
		
		public static const LOAD_PATIENT_MOST_RECENT_VITALS_EVENT:String = "LOAD_PATIENT_MOST_RECENT_VITALS_EVENT";
		
		public static const LOAD_PATIENT_PREVIOUS_VITALS_EVENT:String = "LOAD_PATIENT_PREVIOUS_VITALS_EVENT";
		public static const LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT:String = "LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT";
		public static const LOAD_PATIENT_CHRONIC_DIAGNOSIS_BY_PATIENT_ID:String = "LOAD_PATIENT_CHRONIC_DIAGNOSIS_BY_PATIENT_ID";
		public static const LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT:String = "LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT";
		public static const LOAD_PROCEDURE_BY_VISIT_ID_EVENT:String = "LOAD_PROCEDURE_BY_VISIT_ID_EVENT";
		
		public static const LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT:String = "LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT";
		public static const MANAGE_PATIENT_FAIMLY_HISTORY_EVENT:String = "MANAGE_PATIENT_FAIMLY_HISTORY_EVENT";

		public static const MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT:String = "MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT";

		public static const LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT:String = "LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT";
		public static const LOAD_FOLLOW_UP_METHOD_TYPE_EVENT:String =	"LOAD_FOLLOW_UP_METHOD_TYPE_EVENT";
		public static const LOAD_INSTRUCTION_AGE_TYPE_EVENT:String = "LOAD_INSTRUCTION_AGE_TYPE_EVENT";
		public static const LOAD_PATIENT_ALL_MED_EVENT:String = "LOAD_PATIENT_ALL_MED_EVENT";
		public static const LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT:String = "LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT";
		public static const LOAD_INSTRUCTION_DURATION_TYPE_EVENT:String = "LOAD_INSTRUCTION_DURATION_TYPE_EVENT";
		public static const LOAD_SERVICE_TYPE_EVENT:String = "LOAD_SERVICE_TYPE_EVENT";
		
		public static const LOAD_ALL_DURATION_TYPES_EVENT:String = "LOAD_ALL_DURATION_TYPES_EVENT";
		public static const LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT:String =	"LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT";
		public static const LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT : String =	"LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT";
		public static const LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT:String =	"LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT";
		
		public static const LOAD_ICD_CODE_EVENT:String = "LOAD_ICD_CODE_EVENT2";
		public static const LOAD_MEDICAL_HISTORY_EVENT:String =	"LOAD_MEDICAL_HISTORY_EVENT";
		public static const LOAD_FAMILY_HISTORY_EVENT:String = "LOAD_FAMILY_HISTORY_EVENT";
		public static const LOAD_SOCIAL_HISTORY_EVENT:String = "LOAD_SOCIAL_HISTORY_EVENT";
		public static const LOAD_DISEASE_TYPE_EVENT:String = "LOAD_DISEASE_TYPE_EVENT";
		public static const LOAD_ALL_BLOOD_RELATIONSHIP_TYPE_DTO_EVENT:String = "LOAD_ALL_BLOOD_RELATIONSHIP_TYPE_DTO_EVENT";
		
		public static const LOAD_PATIENT_HPI_BY_VISIT_EVENT:String = "LOAD_PATIENT_HPI_BY_VISIT_EVENT";
		public static const LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT:String = "LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT";
		public static const LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT:String = "LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT";
		public static const LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT:String = "LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT";
		public static const MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT:String = "MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT";
		
		public static const SAVE_MEDICAL_HISTORY_EVENT:String = "SAVE_MEDICAL_HISTORY_EVENT";
		
		
		public static const MANAGE_PATIENT_VITALS_EVENT:String = "MANAGE_PATIENT_VITALS_EVENT";
		
		public static const MANAGE_PATIENT_HPI_EVENT:String = "MANAGE_PATIENT_HPI_EVENT";
		public static const MANAGE_PATIENT_LAB_IN_EVENT:String = "MANAGE_PATIENT_LAB_IN_EVENT";
		
		public static const MANAGE_PATIENT_DIAGNOSIS_EVENT:String = "MANAGE_PATIENT_DIAGNOSIS_EVENT";
		public static const MANAGE_PATIENT_PROCEDURE_EVENT:String = "MANAGE_PATIENT_PROCEDURE_EVENT";
		public static const MANAGE_PATIENT_LABOUT_EVENT:String = "MANAGE_PATIENT_LABOUT_EVENT";
		public static const MANAGE_PATIENT_RECOMMANDATION_EVENT:String = "MANAGE_PATIENT_RECOMMANDATION_EVENT";
		public static const MANAGE_PATIENT_FOLLOW_UP_EVENT:String = "MANAGE_PATIENT_FOLLOW_UP_EVENT";
		public static const MANAGE_PATIENT_SOCIAL_HISTORY_EVENT:String = "MANAGE_PATIENT_SOCIAL_HISTORY_EVENT";
		public static const MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT:String = "MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT";
		
		public static const MANAGE_VISIT_OWNER_EVENT:String = "MANAGE_VISIT_OWNER_EVENT";
		
		public static const MARK_VALID_DATA_EXISTS_EVENT:String = "MARK_VALID_DATA_EXISTS_EVENT";
		
		
		public static const GENERATE_SOAP_NOTE_PREVIEW_EVENT:String = "GENERATE_SOAP_NOTE_PREVIEW_EVENT";
		public static const Load_Review_Histroy_Event:String = "Load_Review_Histroy_Event";
		public static const Load_VISIT_MODULE_TYPE_Event:String = "Load_VISIT_MODULE_TYPE_Event";
		
		public static const Save_Review_Histroy_Event:String = "Save_Review_Histroy_Event";
		
		public static const LOAD_ENCOUNTER_TYPES_EVENT:String = "LOAD_ENCOUNTER_TYPES_EVENT";
		public static const DELETE_COMPREHENSIVE_MODULE_EVENT:String = "DELETE_COMPREHENSIVE_MODULE_EVENT";
		public static const LOAD_PHYSICIANS_BY_CLINICBRANCH_ID:String = "LOAD_PHYSICIANS_BY_CLINICBRANCH_ID";
		
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
		
		protected function addCommands():void
		{
			addCommand(CREATE_NEW_VISIT, CreateVisitCommand);
			
			addCommand(MANAGE_ROS, ManagePatientROSCommand);
			addCommand(MANAGE_PHYSICAL, ManagePatientPhysicalCommand);
			
			addCommand(LOAD_COMHENSIVE_HISTORY_STATIC_DATA,LoadComhensiveHistoryStaticDataCommand);
			addCommand(LOAD_IMMUNICATION_STATIC_DATA,LoadImmunicationStaticDataCommand);
			addCommand(LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT,LoadImmunizationByVisitIDCommand);
			
			addCommand(LOAD_LABIN_STATIC_DATA_EVENT,LoadLabInStaticDataCommand);
			addCommand(LOAD_HPI_STATIC_DATA_EVENT, LoadHPIStaticDataCommand);
			addCommand(LOAD_ALL_HPI_DETAIL_TYPES_EVENT, LoadAllHPIDetailTypesCommand);
			addCommand(LOAD_ROS_CATEGORY_TYPES_EVENT, LoadROSCategoryTypesCommand);
			addCommand(LOAD_PHYSICAL_CATEGORY_TYPES_EVENT, LoadPhysicalCategoryTypesCommand);
			addCommand(LOAD_CPT_MEDICAL_TYPES_EVENT, LoadCPTMedicalTypesCommand );
			addCommand(LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT , LoadLabTestTypeStaticDataCommand);
			addCommand(LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT , LoadLabSpecimenTypeStaticDataCommand);
			addCommand(LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT , LoadLabTypeStaticDataCommand);
			addCommand(LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT , LabTestOrderMethodTypeCommand);
			addCommand(LOAD_LAB_PRIORITY_STATIC_DATA_EVENT , LoadLabPriorityTypeCommand);
			addCommand(LOAD_LIONIC_LAB_TEST_TYPE_EVENT , LoadLIONICLabTestTypeCommand);
			addCommand(LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT , LoadPatientLabsByVisitCommand);
			
			addCommand(LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT , LoadFollowupDataControlTypeCommand);
			addCommand(LOAD_FOLLOW_UP_METHOD_TYPE_EVENT , LoadFollowUpMethodTypeCommand);
			addCommand(LOAD_INSTRUCTION_AGE_TYPE_EVENT , LoadFollowUpInstructionAgeTypesCommand);
			addCommand(LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT , LoadFollowUpInstructionAgeValueTypesCommand);
			addCommand(LOAD_INSTRUCTION_DURATION_TYPE_EVENT , LoadFollowUpInstructionDurationTypeCommand);
			addCommand(LOAD_SERVICE_TYPE_EVENT , LoadFollowUpServiceTypeCommand);
			
			addCommand(LOAD_ALL_DURATION_TYPES_EVENT , LoadAllRecommendationDurationTypesCommand);
			addCommand(LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT , LoadAllRecommendationMethodTypesCommand);
			addCommand(LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT , LoadAllRecommendationPlanTypesCommand);
			addCommand(LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT , LoadRecommendationLinksAutoCompleteCommand);
			addCommand(LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT , LoadPatientRecommendationByVisitIdCommand);
			
			addCommand(LOAD_ICD_CODE_EVENT , LoadDiagnosisICDCodeCommand);
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
			addCommand(MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT , ManagePatientSocialHistoryDeleteCommand);
			addCommand(MANAGE_PATIENT_FAIMLY_HISTORY_EVENT , ManagePatientFamilyHistoryCommand);
			
			addCommand(LOAD_PATIENT_HPI_BY_VISIT_EVENT, LoadPatientHPIByVisitIdCommand);
			
			addCommand(MANAGE_PATIENT_VITALS_EVENT , ManagePatientVitalCommand);
			
			addCommand(MANAGE_PATIENT_HPI_EVENT , ManagePatientHPICommand);
			
			addCommand(MANAGE_PATIENT_DIAGNOSIS_EVENT , ManagePatientDiagnosisCommand);
			addCommand(MANAGE_PATIENT_PROCEDURE_EVENT , ManagePatientProcedureCommand);
			addCommand(MANAGE_PATIENT_LABOUT_EVENT , ManagePatientLabsCommand);
			
			addCommand(LOAD_LABIN_BY_VISIT_ID_EVENT , LoadPateintInHouseLabsByVisitIdCommand);
			addCommand(MANAGE_PATIENT_LAB_IN_EVENT , ManagePatientInHouseLabsCommand);
			addCommand(LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT , LoadPatientDiagnosisByVisitIdCommand);
			addCommand(LOAD_PATIENT_CHRONIC_DIAGNOSIS_BY_PATIENT_ID, LoadPatientChronicDiagnosisByPatientIdCommand);
			
			addCommand(LOAD_PROCEDURE_BY_VISIT_ID_EVENT , LoadProcedureByVisitIDCommand);
			addCommand(MANAGE_PATIENT_RECOMMANDATION_EVENT , ManagePatientRecommendationCommand);
			
			addCommand(LOAD_FOLLOW_UP_MERGE_BY_VISIT_ID_EVENT , LoadFollowUpMergeByVisitIdCommand);
			addCommand(MANAGE_PATIENT_FOLLOW_UP_EVENT , ManagePatientFollowupMergedCommand);
			
			addCommand(GENERATE_SOAP_NOTE_PREVIEW_EVENT , GenerateSoapNotePreviewCommand);
			addCommand(MANAGE_VISIT_OWNER_EVENT , ManageVisitOwnerCommand);
			
			addCommand(MARK_VALID_DATA_EXISTS_EVENT , MarkValidDataExistsCommand);
			addCommand(Load_Review_Histroy_Event , LoadReviewHistroyCommand);
			addCommand(Save_Review_Histroy_Event , SaveReviewHistroyCommand);
			
			addCommand(LOAD_ENCOUNTER_TYPES_EVENT , LoadEncounterTypesCommand);
			addCommand(Load_VISIT_MODULE_TYPE_Event , LoadVisitModuleTypesCommand);
			addCommand(LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT , LoadModuleNotesByVisitIdCommand);
			addCommand(MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT , ManageModuleNotesCommand);
			
			addCommand(LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT , LoadModuleDictationByVisitIdCommand);
			addCommand(MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT , ManageModuleDictationCommand);
			addCommand(DELETE_COMPREHENSIVE_MODULE_EVENT , DeleteComprehensiveModuleDatabyPatientIDCommand);
			addCommand(LOAD_PHYSICIANS_BY_CLINICBRANCH_ID , LoadPhysiciansbyClinicBranchIDCommand);
			
			addCommand(LOAD_PATIENT_ALL_MED_EVENT , GetPatientAllMedCommand);
		}
		
		public function ApplicationConfig(configXML:XML ):void
		{
			QIConstants.EPRESCRIPTION_RESTFULSERVICE = XmlUtils.getPropertyValueByName('EPRESCRIPTION_RESTFULSERVICE', configXML);
			QIConstants.RESTFULL_SERVICE_BASE_URL 	 = XmlUtils.getPropertyValueByName('EPRESCRIPTION_QM_SERVICE', configXML);
			QIConstants.BILLING_RESTFUL_SERVICE 	 = XmlUtils.getPropertyValueByName('BILLING_RESTFUL_SERVICE', configXML);
		}
	}
}

class Lock
{
	//Singlton Lock
}