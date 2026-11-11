package com.gazuntite.input.event.history.assessment.plan.labOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	import com.gazuntite.input.utils.QIConstants;
	
	public class LoadLabsByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadLabsByPatientIdPagedEvent()
		{
			super (QIController.LOAD_LABS_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}