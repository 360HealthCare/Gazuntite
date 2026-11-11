package com.zigron.gazuntite.delegate.session
{
	import com.adobe.cairngorm.business.Responder;
	import com.zigron.gazuntite.model.valueObjects.login.SessionDTO;
	import com.zigron.gazuntite.utils.Constants;
	import com.zigron.serialization.json.JSON_Zig;
	
	import flash.net.URLRequestMethod;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class UpdateUserSessionStatusDelegate
	{
	
		private var responder : IResponder;
		private var RestfulService : HTTPService;
		
		public function UpdateUserSessionStatusDelegate(  responder : IResponder )
		{		
			this.responder 		= responder;
			var url:String 		= Constants.RESTFULL_SERVICE_BASE_URL + 'updateUserSessionStatusID';
			RestfulService 			= new HTTPService(url);
			RestfulService.url 		= url;
			
			RestfulService.contentType 	= "application/json; charset=utf-8";
			RestfulService.method = "POST";
			
			/*RestfulService.contentType =  "application/xml";//"Text/Xml";
			RestfulService.method		= URLRequestMethod.POST;*/
			
			RestfulService.addEventListener(FaultEvent.FAULT,onFault);
			RestfulService.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function UpdateUserSessionRestService(dto:SessionDTO) : void 
		{
			
			/////////////// voilated the protocol of E4x/Xml Contract between Front-end Team & Back-End team , On the Exclusice Demand of ALAMANDAR HUSSAIN,
			RestfulService.resultFormat = "e4x";
			CursorManager.setBusyCursor();
			var json:String = JSON_Zig.encode(dto);

			RestfulService.send( json);
		}
		
		private function onResult(event:ResultEvent):void
		{
			CursorManager.removeBusyCursor();
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			responder.fault(event);			
		}
	}
}