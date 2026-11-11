package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class CoSignVisitEvent extends CairngormEvent
	{
		public var visitId : int;
		
		public var functionName 	: Function;
		
		public function CoSignVisitEvent(visitId : int,functionName 	: Function) {
			super( QIController.CO_SIGN_VISIT_EVENT);
			this.visitId = visitId;
			this.functionName = functionName;
			
		}
	}
}