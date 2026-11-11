package com.gazuntite.input.event.visit.physical.ros
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ros.ROSDTO;
	import com.gazuntite.input.controller.QIController;
	
	public class ManagePatientROSEvent extends CairngormEvent
	{
		public var IsEditMode:Boolean;
		public var dto:ROSDTO;
		public var callBack:Function;
		
		public function ManagePatientROSEvent(callBack:Function = null)
		{
			super(QIController.MANAGE_ROS);
			this.callBack = callBack;
		}
	}
}