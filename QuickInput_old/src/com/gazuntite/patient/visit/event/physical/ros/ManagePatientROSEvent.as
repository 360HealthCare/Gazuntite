package com.gazuntite.patient.visit.event.physical.ros
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class ManagePatientROSEvent extends CairngormEvent
	{
		public function ManagePatientROSEvent()
		{
			super(QIController.MANAGE_ROS);
		}
	}
}