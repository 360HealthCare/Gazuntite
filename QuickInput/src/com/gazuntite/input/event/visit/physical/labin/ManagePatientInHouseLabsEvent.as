package com.gazuntite.input.event.visit.physical.labin
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientInHouseLabsEvent extends CairngormEvent
	{
		public var callBack:Function;
		public var sectionName:String;
		
		public function ManagePatientInHouseLabsEvent(_sectionName:String, _callback:Function = null)
		{
			super (QIController.MANAGE_PATIENT_LAB_IN_EVENT);
			
			this.sectionName = _sectionName;
			callBack = _callback;
		}
	}
}