package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	

	public class CreateVisitCommonEvent extends CairngormEvent
	{
		public var functionName : Function;
		
		public var userId		: String;
	
		public function CreateVisitCommonEvent(userId : String, _functionName : Function = null)
		{
			super( QSCommonController.CREATE_VISIT_EVENT);
			this.functionName 	= _functionName;
			this.userId 		= userId;
		}
	}
}