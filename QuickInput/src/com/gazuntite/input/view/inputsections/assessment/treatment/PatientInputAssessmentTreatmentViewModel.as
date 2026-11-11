package com.gazuntite.input.view.inputsections.assessment.treatment
{
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;

	[Bindable]
	public class PatientInputAssessmentTreatmentViewModel
	{
		protected static var instance:PatientInputAssessmentTreatmentViewModel;
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var dictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		
		public var treatmentInputTabSelectedIdx:int;
		
		public function PatientInputAssessmentTreatmentViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			dictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			treatmentInputTabSelectedIdx = 0;
		}
		
		public static function getInstance():PatientInputAssessmentTreatmentViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputAssessmentTreatmentViewModel(0);
			}
			
			return instance;
		}
	}
}