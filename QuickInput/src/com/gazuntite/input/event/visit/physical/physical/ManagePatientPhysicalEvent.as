package com.gazuntite.input.event.visit.physical.physical
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.input.controller.QIController;
	
	public class ManagePatientPhysicalEvent extends CairngormEvent
	{
		public var IsEditMode:Boolean;
		public var dto:PhysicalDTO;
		public var callBack:Function;
		
		public function ManagePatientPhysicalEvent(callBack:Function = null)
		{
			super(QIController.MANAGE_PHYSICAL);
			this.callBack = callBack;
		}
	}
}