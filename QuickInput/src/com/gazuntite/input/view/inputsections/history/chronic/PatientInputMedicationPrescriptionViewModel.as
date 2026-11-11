package com.gazuntite.input.view.inputsections.history.chronic
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.common.event.LoadPatientMedEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIUtilityFunctions;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputMedicationPrescriptionViewModel
	{
		protected static var instance:PatientInputMedicationPrescriptionViewModel;
		
		private var model:QIModelLocator = QIModelLocator.getInstance();
		public var notesDTO:ModuleNoteDTO;
		public var medicationDictationNoteViewModel:PatientDictationNoteViewModel;
		public var medicationDictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inlineMedicationDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputMedicationPrescriptionViewModel(singleton:Number)
		{
			medicationDictationNoteViewModel = new PatientDictationNoteViewModel();
			
			medicationDictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inlineMedicationDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineMedicationDictationNoteViewModel.inlineEditing = true;
			
			notesDTO = QIUtilityFunctions.getModuleNoteDTO(QIConstants.CHRONIC_MEDICATION_MODULE_NAME);
		}
		
		public static function getInstance():PatientInputMedicationPrescriptionViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputMedicationPrescriptionViewModel(0);
			}
			
			return instance;
		}
		
		public function loadMedicationPrescription():void
		{
			var securityHeaderXML:XML;
			securityHeaderXML = <Header />;					
			securityHeaderXML.@EUserName = "TESTUSER";
			securityHeaderXML.@EPassword = "TESTPASS";
			securityHeaderXML.@ClinicID	= "sad";
			
			var loadPatientPrescriptionEvent:LoadPatientMedEvent = new LoadPatientMedEvent("0", model.patientDTO.GAXENID,5, onPrescriptionLoaded);	// 7 for all data of chronic			
			loadPatientPrescriptionEvent.data = securityHeaderXML; 				
			CairngormEventDispatcher.getInstance().dispatchEvent(loadPatientPrescriptionEvent);
		}
		
		public function onPrescriptionLoaded(patientMedAC:ArrayCollection, patientChronicMedAC:ArrayCollection, patientMedAC_inactive:ArrayCollection, patientChronicMedAC_inactive:ArrayCollection):void
		{
			model.medicationDTOList = patientChronicMedAC;	//for QI Chronic Medication
			model.prescriptionDToList = patientMedAC;	//for QI Prescription
		}
		
		public function clearMedicationSectionDictationNote():void
		{
			if (!notesDTO)
				return;
			
			notesDTO.Note = "";
		}
		public function clearMedicationPrescriptionData():void
		{
			// PMH - Chronic Medication Section/////////
			if (model.medicationDTOList)
				model.medicationDTOList.removeAll();
			else
				model.medicationDTOList = new ArrayCollection();
			
			// ASESSMENTS - Treatment - Prescription Section
			if (model.prescriptionDToList)
				model.prescriptionDToList.removeAll();
			else
				model.prescriptionDToList = new ArrayCollection();
			
			if (model.CurrentprescriptionDToList)
				model.CurrentprescriptionDToList.removeAll();
			else
				model.CurrentprescriptionDToList = new ArrayCollection();
		}
		
		
	}
}