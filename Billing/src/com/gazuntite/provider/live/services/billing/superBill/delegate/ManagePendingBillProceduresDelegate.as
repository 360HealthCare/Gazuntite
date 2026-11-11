package com.gazuntite.provider.live.services.billing.superBill.delegate
{
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePendingBillProceduresDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.billing.delegate.SuperBill.ManagePendingBillProceduresDelegate");
		
		public function ManagePendingBillProceduresDelegate(responder : IResponder)
		{
			
			this.responder 		= responder;
			var url:String 		= SuperBillConstants.RESTFULL_SERVICE_BASE_URL + SuperBillServiceMethods.MANAGE_PENDING_BILL_PROCEDURES;
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function ManagePendingBillProcedures(ProcedureXml:XML ):void
		{			
			
			service.resultFormat 	= "e4x";
			service.contentType 	= "Text/Xml"; 
			service.method 			= URLRequestMethod.POST;
			service.send( ProcedureXml );	
			trace( service.url );
			
			//uploadPath = uploadPath +'/'+managedByUserId;
			
			/*var urlRequest:URLRequest = new URLRequest();
			urlRequest.url = uploadPath;
			urlRequest.contentType = "Text/Xml"; 
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = ProcedureXml;
			urlRequest.requestHeaders.push( new URLRequestHeader( 'Cache-Control', 'no-cache' ) );
			
			var urlLoader:URLLoader = new URLLoader();
			
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onUploadingError);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onUploadingError);
			urlLoader.addEventListener(AsyncErrorEvent.ASYNC_ERROR, onUploadingError);
			urlLoader.addEventListener(Event.COMPLETE, onUploadingSuccess);
			
			urlLoader.load(urlRequest);
			
			trace( "ManagePendingBillProceduresDelegate", urlRequest.url );
			*/
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