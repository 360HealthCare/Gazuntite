package com.gazuntite.patient.visit.event.physical.ros
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadROSCategoryTypesEvent extends CairngormEvent
	{
		public var IsMale:Boolean;
		public function LoadROSCategoryTypesEvent(isMale:Boolean)
		{
			super( QIController.LOAD_ROS_CATEGORY_TYPES_EVENT);
			this.IsMale = isMale;
		}
	}
}