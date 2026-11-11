package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	/**
	 * @ Author - TA
	 * Zigron Inc
	 **/
	
	public class GetNDCByDRUGIDProductIDDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function GetNDCByDRUGIDProductIDDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= EConstants.RESTFULL_SERVICE_BASE_URL + "GetNDCByDRUGIDProductIDPost";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetMedicineList(data:XML, strengthID:String='0', ProductId:String='0', ndc:String='0', drugId:String='0'):void
		{
			if(strengthID == null)
				strengthID = '0';
			if(ProductId == null)
				ProductId = '0';
			if(ndc == null)
				ndc = '0';
			if(drugId == null)
				drugId = '0';
			
			var NDCCriteriasXml:XML 			= <NDCCriterias/>;
			NDCCriteriasXml.@StrengthID 		= strengthID;
			NDCCriteriasXml.@GENPRODUCT_ID 		= ProductId;
			NDCCriteriasXml.@NDC 				= ndc;
			NDCCriteriasXml.@DrugID 			= drugId;
			NDCCriteriasXml.appendChild(data);
			
			service.send(NDCCriteriasXml);	
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