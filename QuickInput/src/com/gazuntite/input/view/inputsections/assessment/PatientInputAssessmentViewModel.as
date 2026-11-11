package com.gazuntite.input.view.inputsections.assessment
{
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.view.inputsections.assessment.diagnosis.PatientInputAssessmentDiagnosisViewModel;
	import com.gazuntite.input.view.inputsections.assessment.plan.PatientInputAssessmentPlanViewModel;
	import com.gazuntite.input.view.inputsections.assessment.plan.labOut.PatientInputAssessmentLabOutViewModel;
	import com.gazuntite.input.view.inputsections.assessment.plan.recommendation.PatientInputAssessmentRecommendationViewModel;
	import com.gazuntite.input.view.inputsections.assessment.treatment.procedure.PatientInputAssessmentProcedureViewModel;

	[Bindable]
	public class PatientInputAssessmentViewModel
	{
		protected static var instance:PatientInputAssessmentViewModel;
	
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var diagnosisViewModel:PatientInputAssessmentDiagnosisViewModel = PatientInputAssessmentDiagnosisViewModel.getInstance();
		public var procedureViewModel:PatientInputAssessmentProcedureViewModel = PatientInputAssessmentProcedureViewModel.getInstance();
		public var planViewModel:PatientInputAssessmentPlanViewModel = PatientInputAssessmentPlanViewModel.getInstance();
		
		public var refreshAssessmentData:Boolean;
		
		public function PatientInputAssessmentViewModel(useSingleton:Number)
		{
		}
		
		public static function getInstance():PatientInputAssessmentViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputAssessmentViewModel(1);
			}
			
			return instance;
		}
		
		public function loadAssessmentTabData():void
		{
			if (refreshAssessmentData)
			{
				diagnosisViewModel.loadPatientDiagnosis();
				
				diagnosisViewModel.loadPatientAcuteDiagnosisHistory();
				diagnosisViewModel.loadPatientChronicDiagnosisHistory();
				diagnosisViewModel.loadPatientResolvedDiagnosisHistory();
				
				procedureViewModel.loadPatientProcedureByVisitID();
				procedureViewModel.loadPatientProcedureByPatientID();
				
				planViewModel.loadPlanData();
				
				refreshAssessmentData = false;
			}
		}
		
		public function loadAssessmentStaticData():void
		{
			planViewModel.loadPlanStaticData();
		}
		
		public function loadFollowUpLabs():void
		{
			planViewModel.loadFollowUpLabs();
		}
		
		public function clearAssessmentTabData():void
		{
			diagnosisViewModel.clearPatientDiagnosis();
			procedureViewModel.clearPatientProcedure();
			planViewModel.clearPlanData();
		}
		
		public function clearSectionLevelNotes():void
		{
			diagnosisViewModel.dictationNoteViewModel
		}
	}
}