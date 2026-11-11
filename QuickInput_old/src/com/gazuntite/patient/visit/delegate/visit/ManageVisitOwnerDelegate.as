package com.gazuntite.patient.visit.delegate.visit
{
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.patient.visit.utils.QIConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManageVisitOwnerDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function ManageVisitOwnerDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + 'ManageVisitOwner/' ;
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		public function ManageVisitOwner(OwnerUserID:String, OwnerUserTypeID:String, VisitOwnerTypeID:String, VisitID:String, modified_by:String):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url +=  OwnerUserID +'/'+ OwnerUserTypeID +'/'+ VisitOwnerTypeID +'/'+ VisitID  +'/'+ modified_by;
			service.send();
		}
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}