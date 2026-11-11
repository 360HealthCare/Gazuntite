package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class SignVisitEvent extends CairngormEvent
	{
		public var visitId : int;
		
		public var functionName 	: Function;
		
		public function SignVisitEvent(visitId : int,functionName 	: Function) {
			super( QIController.SIGN_VISIT_EVENT);
			this.visitId = visitId;
			this.functionName = functionName;
			
		}
	}
}