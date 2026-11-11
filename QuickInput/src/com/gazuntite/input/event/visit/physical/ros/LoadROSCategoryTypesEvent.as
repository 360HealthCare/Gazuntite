package com.gazuntite.input.event.visit.physical.ros
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
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