package com.gazuntite.input.event.visit.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientDiagnosisEvent extends CairngormEvent
	{
		public var sectionName:String;
		public var associateType:String;
		
		public function ManagePatientDiagnosisEvent(_sectionName:String, _associateType:String)
		{
			super (QIController.MANAGE_PATIENT_DIAGNOSIS_EVENT);
			
			this.sectionName = _sectionName;
			this.associateType = _associateType;
		}
	}
}