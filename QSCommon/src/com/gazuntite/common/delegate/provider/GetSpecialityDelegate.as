package com.gazuntite.common.delegate.provider
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetSpecialityDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function GetSpecialityDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.EPRESCRIPTION_RESTFULL_SERVICE_BASE_URL; 
			service 			= new HTTPService(url);
			service.url 		= url;
			service.contentType = "Text/Xml";
			service.method		= "POST";
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetSpeciality(data:XML):void
		{
			service.url = service.url + QSCommonServiceMethods.GET_PROVIDER_SPECIALITY_TYPE_OLD;
			service.send(data);	
		}
		
		public function GetSpecialityNew(data:XML):void
		{
			service.url = service.url + QSCommonServiceMethods.GET_PROVIDER_SPECIALITY_TYPE_NEW;
			service.send(data);	
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