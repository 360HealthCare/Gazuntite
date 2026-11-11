package com.gazuntite.input.event.history.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.gazuntite.skins.chrome.buttonSkins.superBillAddButton;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadResolvedDiagnosisByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadResolvedDiagnosisByPatientIdPagedEvent()
		{
			super(QIController.LOAD_RESOLVED_DIAGNOSIS_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}