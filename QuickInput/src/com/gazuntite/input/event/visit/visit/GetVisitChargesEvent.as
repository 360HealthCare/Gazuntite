package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class GetVisitChargesEvent extends CairngormEvent
	{
		public var VisitId      	:int;		
		public var callBackFunction :Function;
		
		public function GetVisitChargesEvent(VisitId:int,callBackFunction :Function = null)
		{
			super(QIController.GET_VISIT_CHARGES_EVENT);
			this.VisitId    		=  VisitId ;
			this.callBackFunction 	=  callBackFunction;
		}
	}
}