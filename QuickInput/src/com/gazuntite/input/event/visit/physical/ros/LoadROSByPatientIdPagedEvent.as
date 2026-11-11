package com.gazuntite.input.event.visit.physical.ros
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadROSByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadROSByPatientIdPagedEvent()
		{
			super (QIController.LOAD_ROS_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}