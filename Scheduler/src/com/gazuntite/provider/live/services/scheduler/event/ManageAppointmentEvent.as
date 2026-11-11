package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;

	public class ManageAppointmentEvent extends CairngormEvent
	{
		public var appointmentXML:XML;
		public var providerId:int;
		public var userTypeId:int;
		public var functionName:Function;
		
		public function ManageAppointmentEvent(_appointmentXML:XML, _providerId:int, _userTypeId:int, _functionName:Function)
		{
			super(SchedulerController.MANAGE_APPOINTMENTS_EVENT);
			
			this.appointmentXML = _appointmentXML;
			this.providerId		= _providerId;
			this.userTypeId		= _userTypeId;
			this.functionName	= _functionName;
		}
	}
}