package com.gazuntite.provider.eprescription.services.patient.delegate.billing
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	import com.gazuntite.provider.eprescription.services.patient.util.PSConstants;
	import com.gazuntite.provider.eprescription.services.patient.util.PSServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.osmf.logging.Logger;

	public class ManageProviderInsuranceDelegate
	{
		private var responder		:IResponder;
		private var service			:HTTPService;
		
		public function ManageProviderInsuranceDelegate(responder:IResponder)
		{
			this.responder    = responder;
			var url:String    = EConstants.RESTFULL_USER_SERVICE_BASE_URL + PSServiceMethods.MANAGE_PROVIDER_INSURANCE;
			service           = new HTTPService(url);
			service.url 	  = url;
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);			
		}
		
		public function ManageProviderInsurance(xmlData:XML):void
		{
			service.showBusyCursor = true;
			service.resultFormat   = "e4x";
			service.contentType 	= "Text/Xml";
			service.method         = URLRequestMethod.POST;
			service.send(xmlData);
			
			trace( "ManageProviderInsuranceDelegate: ", service.url );
		}
		
		public function onResult(event:ResultEvent):void
		{
			responder.result(event);
			//Logger.debug( "ManageProviderInsuranceDelegate -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		public function onFault(event:FaultEvent):void
		{
			responder.fault(event);
			//Logger.debug( "ManageProviderInsuranceDelegate -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
	}
}