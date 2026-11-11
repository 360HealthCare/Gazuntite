package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadReviewHistroyEvent extends CairngormEvent
	{
		public var VisitId      	:int;
		public var SessionId  		:String;
		public var ProviderId 		:int;
		public var callBackFunction :Function;
		
		public function LoadReviewHistroyEvent(SessionId:String,VisitId:int,ProviderId:int,callBackFunction :Function)
		{
			super(QIController.Load_Review_Histroy_Event);
			this.SessionId 			=  SessionId ;
			this.VisitId    		=  VisitId ;
			this.ProviderId 		=  ProviderId ;
			this.callBackFunction 	=  callBackFunction
		}
	}
}