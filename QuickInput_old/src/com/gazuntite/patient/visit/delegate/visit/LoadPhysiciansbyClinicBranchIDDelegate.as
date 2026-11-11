package com.gazuntite.patient.visit.delegate.visit
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadPhysiciansbyClinicBranchIDDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadPhysiciansbyClinicBranchIDDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + 'LoadPhysiciansbyClinicBranchID';			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function LoadPhysiciansbyClinicBranchID(BranchId:int, VisitID:int, patientID:int, isEditMode:String, UserId:int):void
		{
			service.url = service.url + "/" + BranchId  + "/" + VisitID +'/'+ patientID +'/'+ isEditMode +'/'+ UserId;
			service.resultFormat = "e4x";
			
			service.send();	
			
			trace( "LoadPhysiciansbyClinicBranchIDDelegate", service.url );
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