package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllUserTypeDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllUserTypeDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.USER_MANAGER_RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.LOAD_ALL_USER_TYPE_NEW;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function GetUserTypeList():void
		{
			service.showBusyCursor = true;
			service.url = service.url;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadAllUserTypeDelegate", service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			service.showBusyCursor = false;
			responder.result(event);
			//logger.debug( "LoadAllUserTypeDelegate -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			service.showBusyCursor = false;
			responder.fault(event);			
		}
	}
}