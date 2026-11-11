package com.zigron.gazuntite.delegate.rapidAccess
{
	import com.zigron.gazuntite.utils.Constants;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class ManageQuickLinksDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function ManageQuickLinksDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			
			var url:String 		= Constants.RESTFULL_USER_MANAGER_SERVICE_BASE_URL + 'ManageQuickLinks'; 
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method 		= URLRequestMethod.POST;
			service.contentType = 'Text/XML';
		}
		
		public function ManageQuickLinks(isdefault:Boolean, UserId:int, branhID:int, createdBy:int, arr:ArrayCollection):void
		{
			var xml:String = '<ArrayOfInt>';
			
			if(isdefault)
			{
				xml += '<int>2</int><int>3</int><int>5</int><int>4</int><int>11</int></ArrayOfInt>'
			}else
			{
				for (var i:int = 0; i < arr.length; i++) 
				{
					xml += getstationID(arr[i].QuickLinkTypeID)
				}
				xml += '</ArrayOfInt>';
			}
			
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
			service.resultFormat = "e4x";
			service.url 		+= '/'+ UserId +'/'+branhID +'/'+createdBy;
			service.send(xml);	
		}
		
		public function getstationID(i:int):String
		{
			return "<int>"+i+"</int>";
		}
		
		private function onResult(event:ResultEvent):void
		{
			service.showBusyCursor = false;
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			service.showBusyCursor = false;
			responder.fault(event);			
		}	
	}
}