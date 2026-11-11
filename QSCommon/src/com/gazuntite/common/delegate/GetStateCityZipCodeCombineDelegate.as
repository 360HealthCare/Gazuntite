package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetStateCityZipCodeCombineDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetStateCityZipCodeCombineDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_ADRESSBOOK_SERVICE_BASE_URL + 'GetStateCityZipCodeP'
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			service.resultFormat = 'e4x'
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetStateCityZipCode(state:String, city:String, zip:String):void
		{
			if(state == '')
				state = '0';
			if(city == '')
				city = '0';
			if(zip == '')
				zip = '0';
			
			var xml:XML 		= <StateCZ />
			xml.@StateName 		= state;
			xml.@CityName 		= city;
			xml.@ZipCode 	    = zip;
			//<StateCZ StateName='ala' CityName='0' ZipCode='0' />
				
			//service.url += state + '/' +  city + '/' +  zip;
			service.send(xml);
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