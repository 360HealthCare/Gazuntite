package com.gazuntite.input.delegate.visit.physical.physical
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class LoadPhysicalCategoryTypesDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.input.delegate.visit.physical.ros.LoadROSCategoryTypesDelegate");
		
		
		public function LoadPhysicalCategoryTypesDelegate(responder : IResponder )
		{		
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.Load_PHYSICAL_Category_Types;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function LoadCategoryTypes(isMale:Boolean, visitID:int, sessionID:String) : void 
		{
			service.url  = service.url + "/" + visitID + "/" + isMale + "/" + sessionID;
			
			trace(service.url);
			service.send();
			
			service.showBusyCursor = true;
		}	
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			service.showBusyCursor = false;
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);	
			service.showBusyCursor = false;
		}
		
		private function onOtherError(event:Event):void
		{
			trace(event);
			service.showBusyCursor = false;
		}
	}
}