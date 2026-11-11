package com.gazuntite.history.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetHistoryByProviderDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetHistoryByProviderDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_MAIN_URL + "LoadPatientHistoryByDoctorUserIDAndClinicBranchID";
			
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetHistory(sectionID:int , branchID:int , providerID:int,patientID:int,sessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url +'/'+ sectionID +'/'+ branchID +'/'+ providerID +'/'+ patientID +'/'+ sessionID; 
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "Get HistoryByProvider Delegate", service.url );
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