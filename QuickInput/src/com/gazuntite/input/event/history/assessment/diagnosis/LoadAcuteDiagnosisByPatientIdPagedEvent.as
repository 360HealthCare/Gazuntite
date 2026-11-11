package com.gazuntite.input.event.history.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadAcuteDiagnosisByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadAcuteDiagnosisByPatientIdPagedEvent()
		{
			super(QIController.LOAD_ACUTE_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}