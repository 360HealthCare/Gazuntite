package com.gazuntite.patient.visit.delegate.visit
{
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GenerateSoapNotePreviewDelegate
	{
		
		[Bindable]
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GenerateSoapNotePreviewDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.GENERATE_SOAP_NOTE_BY_VISIT_ID;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.method 		= "POST";
			service.contentType = 'text/xml';
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);		
		}
		
		public function GeneratePreview( VisitID:int, LoggedInUserSessionID:String, LoggedInUserSelectedBranchId:int , LoggedInUserSelectedStationID:int , isAllSelected:Boolean, isPatientMale:Boolean, IsTemplateVisit :Boolean , gaxenID:String):void
		{
			if(gaxenID == '')
				gaxenID = '0';
			
			var soapNoteXML:XML 				= <SoapNote/>;
			soapNoteXML.@VisitID 				= VisitID;
			soapNoteXML.@sessionID 				= LoggedInUserSessionID;
			soapNoteXML.@clinicbranchId 		= LoggedInUserSelectedBranchId;
			soapNoteXML.@stationId 				= LoggedInUserSelectedStationID;
			soapNoteXML.@isAllSelected 			= isAllSelected;
			soapNoteXML.@isMale 				= isPatientMale;
			soapNoteXML.@isTemp 				= IsTemplateVisit;
			soapNoteXML.@GaxenID 				= gaxenID;
			soapNoteXML.@ProviderName 			= model.VisitProviderName;
			soapNoteXML.@EncounterTypeName 		= model.EncounterTypeName;
			soapNoteXML.@PlaceofService 		= model.placeOfServiceName;
				
			service.url = service.url;
			service.resultFormat = "e4x";
			service.send(soapNoteXML);	
			trace(soapNoteXML);
			trace( "GenerateSoapNoteDelegate", service.url );
			
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