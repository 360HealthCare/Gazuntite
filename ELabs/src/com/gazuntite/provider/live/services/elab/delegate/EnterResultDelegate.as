package com.gazuntite.provider.live.services.elab.delegate
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.live.services.elab.dto.ELabDTO;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	import com.gazuntite.provider.live.services.elab.util.ELabsServiceMethods;
	
	import flash.net.URLRequestMethod;
	import flash.xml.XMLDocument;
	
	import mx.events.Request;
	import mx.formatters.DateFormatter;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class EnterResultDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.elab.delegate.EnterResultDelegate");
		
		public function EnterResultDelegate(responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= ELabsConstant.RESTFULL_SERVICE_BASE_URL + ELabsServiceMethods.ENTER_AND_LOAD_RESULT;
			service 			= new HTTPService(url);
			service.contentType = "Text/Xml";
			service.resultFormat = "e4x";
			service.method		= URLRequestMethod.POST;
			service.url 		= url;
			
			
			logger.debug( "service.url", url );
			
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.addEventListener(FaultEvent.FAULT,onFault);
		}
		
		public function EnterResult( OrderID:String , ResultRanage:String ):void
		{
			CursorManager.setBusyCursor();
			
			var xmlToSend:XML = XmlUtils.getNodeByTagName("EnterResult");
			
			xmlToSend.@["OrderID"] = OrderID;
			xmlToSend.@["Comments"] = ResultRanage;
			
			//service.url = service.url + "/" + OrderID + "/" + ResultRanage;
			service.send(xmlToSend);
			
			if( Log.isDebug() )
			{
				logger.debug( "service.url", service.url );
				logger.debug( "EnterResultDelegate", " OrderID: " + OrderID + " ResultRanage: " + ResultRanage );
			}
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