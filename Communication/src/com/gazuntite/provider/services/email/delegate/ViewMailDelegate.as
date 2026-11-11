/*
*Class: ViewMailDelegate
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.delegate
{
	import com.gazuntite.provider.services.email.util.EmailConstant;
	import com.gazuntite.provider.services.email.util.EmailServiceMethods;
	
	import flash.events.HTTPStatusEvent;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	
	
	public class ViewMailDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.services.email.delegate.ViewMailDelegate");
		
		
		public function ViewMailDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= EmailConstant.RESTFULL_SERVICE_BASE_URL + EmailServiceMethods.GET_EMAIL_DETAILS;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetEmail(emailID:int,userId:int,clinicBranchId:int,stationId:int,isInbox:Boolean):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url +"/"+ emailID +"/" + userId + "/" + clinicBranchId + "/" + stationId+"/"+isInbox;
			service.resultFormat = "e4x";
			service.send();	
			logger.debug( "GetEmailList -- > service.url:<br>" + service.url );
			trace( service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			service.showBusyCursor=false;
			trace(event.result);
			responder.result(event);
			logger.debug( "Get All Emails of a User -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			service.showBusyCursor=false;
			responder.fault(event);			
		}
	}
}