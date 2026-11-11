package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	//import valueObjects.UserSessionDTO;
	
	public class SaveReviewHistroyEvent extends CairngormEvent
	{
		//public var SessionId 			: UserSessionDTO ;
		public var VisitId  			: int ;
		public var providerId			: int ;
		public var SessionId			: String;
		public var xmlData				: XML ;
		public var callBack				:Function;
		
		public function SaveReviewHistroyEvent(SessionId:String ,VisitId:int ,providerId:int, ReviewHistroyXML:XML,callBack:Function):void 
		{	super(QIController.Save_Review_Histroy_Event);
			this.SessionId 		=	SessionId ;
			this.VisitId	 	=	VisitId   ;
			this.providerId		=   providerId ;
			this.xmlData		=	ReviewHistroyXML ;
			this.callBack		=   callBack ;
			
		}
	}
}