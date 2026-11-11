package com.gazuntite.provider.live.services.billing.superBill.delegate
{
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class SaveSuperBillDelegate
	{
		private var model : SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.billing.delegate.SuperBill.SaveSuperBillDelegate");
		
		public function SaveSuperBillDelegate(responder	:IResponder)
		{
			var url:String;
			this.responder 		= responder;
			/*if(model.IsReport == true)
				url 		= SuperBillConstants.RESTFULL_SERVICE_BASE_URL + SuperBillServiceMethods.SAVE_REPORT;
			else*/
				url 		= SuperBillConstants.RESTFULL_SERVICE_BASE_URL + SuperBillServiceMethods.SAVE_SUPER_BILL;
			
			service 			= new HTTPService(url);
			service.url 		= url;			
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		public function SaveSuperBill(SuperBillXml:XML, GenerateBill:String = "" ):void
		{	
			service.url = service.url + GenerateBill;
			service.resultFormat 	= "e4x";
			service.contentType 	= "Text/Xml"; 
			service.method 			= URLRequestMethod.POST;
			service.send( SuperBillXml );	
			trace( service.url );
			
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