package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SearchPharmaciesDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function SearchPharmaciesDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= EConstants.RESTFULL_SERVICE_BASE_URL + "SearchPharmacies/";
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		//pageNo:int, npcid:String, Name:String, address:String, zipcode:String, state:String, city:String, phone:String, fax:String, serviceLevel:int,  changelevel:String, activated:Boolean,callBack:Function
		public function GetPharmacies(pageNo:int=0, NPCID:String="0", name:String="0", address:String="0", zipcode:String="0", state:String="0", city:String="0", phone:String = '0',fax:String='0', servicelevel:int=0, changelevel:String="0", activated:Boolean=false):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
			service.url = service.url +pageNo + "/" + NPCID +"/" + name + "/" + address + "/" + zipcode +"/" + state + "/" + city + "/" + phone + "/" + fax + "/" +servicelevel +"/" + changelevel + "/" + activated ;
			service.resultFormat = "e4x";
			service.send();	
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