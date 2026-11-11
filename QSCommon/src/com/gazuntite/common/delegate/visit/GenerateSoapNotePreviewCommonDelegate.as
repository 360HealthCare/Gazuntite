package com.gazuntite.common.delegate.visit
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	/**
	 * Author : TA
	 * Date   : 17 jan, 2013
	 * Module : for Viewing Soap Note
	 * */
	
	public class GenerateSoapNotePreviewCommonDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GenerateSoapNotePreviewCommonDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL + 'GenerateSoapNoteByVisitID';
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);	
		}
		
		public function GenerateSoapNotePreview(visitID:int, userSessionID:String, userSelectedBranchId:int , userSelectedStationID:int, isAllSelected:Boolean, isMale:Boolean, isTemplateVisit:Boolean, gaxenID:String, visitProvider:String, encounterName:String, placeOfServiecName:String):void
		{
			if(gaxenID == '')
				gaxenID = '0';
			
			service.url = service.url + "/" + visitID + "/" + userSessionID + "/" + userSelectedBranchId + "/" + userSelectedStationID + "/" + isAllSelected + "/" + isMale + "/" + isTemplateVisit + "/" + gaxenID +'/'+visitProvider +'/'+encounterName +'/'+ placeOfServiecName;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "GenerateSoapNotePreviewCommonDelegate", service.url );
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