package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class VerifyUserEvent extends CairngormEvent
	{
		public var password 		: String;
		public var visitId 			: int;
		
		public var functionName 	: Function;
		
		public var originName		:String; // calling function name ---- Constants.VIEW_BACKGROUND_MODULE_NAME
		public var actionName		:String; //
		
		public function VerifyUserEvent( password : String, visitId: int,functionName : Function, originName:String = null, actionName:String = null ) {
			super( QIController.VERIFY_USER_EVENT);
			this.visitId 		= visitId;
			this.password		= password;
			this.functionName 	= functionName;
			
			this.originName = originName;
			this.actionName = actionName;
			
		}
	}
}