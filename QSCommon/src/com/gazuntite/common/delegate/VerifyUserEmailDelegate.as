package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequestMethod;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class VerifyUserEmailDelegate
	{
		private var responder : IResponder;
		private var RestfulService : HTTPService;
		
		public function VerifyUserEmailDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.USER_MANAGER_RESTFULL_SERVICE_BASE_URL;
			RestfulService 			= new HTTPService(url);
			RestfulService.url 		= url;
			
			RestfulService.addEventListener(FaultEvent.FAULT,onFault);
			RestfulService.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function isUniqueEmail(email:String, isUserName:Boolean) : void 
		{
			var emailXML:XML = null;
			if(isUserName)
			{
				emailXML = XmlUtils.getNodeByTagName("UserNameContents");			
				emailXML.@["UserName"] = email;
				RestfulService.url    +=  QSCommonServiceMethods.VERIFY_USER_NAME;
			}
			else
			{
				emailXML = XmlUtils.getNodeByTagName("EmailContents");			
				emailXML.@["Email"] = email;
				RestfulService.url    +=  QSCommonServiceMethods.VERIFY_USER_EMAIL;
			}
			RestfulService.resultFormat = "e4x";
			RestfulService.contentType 	= "Text/Xml"; 
			RestfulService.method 		= URLRequestMethod.POST;
			CursorManager.setBusyCursor();			
			RestfulService.send(emailXML);
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