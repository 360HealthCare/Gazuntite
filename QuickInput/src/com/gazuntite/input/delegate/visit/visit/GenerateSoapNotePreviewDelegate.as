package com.gazuntite.input.delegate.visit.visit
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GenerateSoapNotePreviewDelegate
	{
		[Bindable]	private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GenerateSoapNotePreviewDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.GENERATE_SOAP_NOTE_BY_VISIT_ID;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.method		= URLRequestMethod.POST;
			service.contentType	= "Text/Xml";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);		
		}
		
		public function GeneratePreview( VisitID:int, LoggedInUserSessionID:String, LoggedInUserSelectedBranchId:int , LoggedInUserSelectedStationID:int , 
										 isAllSelected:Boolean, isPatientMale:Boolean, IsTemplateVisit :Boolean , gaxenID:String,
										 ProviderName:String, EncounterTypeName:String, PlaceofService:String):void
		{
			//service.showBusyCursor = true;
		//	if(gaxenID == '')
		//		gaxenID = '0';
			var xml2Post:XML 				= XmlUtils.getNodeByTagName( "SoapNote" );
			xml2Post.@VisitID 				= VisitID;
			xml2Post.@sessionID 			= LoggedInUserSessionID;
			xml2Post.@clinicbranchId 		= LoggedInUserSelectedBranchId;
			xml2Post.@stationId 			= LoggedInUserSelectedStationID;
			xml2Post.@isAllSelected 		= isAllSelected;
			xml2Post.@isMale 				= isPatientMale;
			xml2Post.@isTemp 				= IsTemplateVisit;
			xml2Post.@GaxenID 				= model.patientDTO.GAXENID;
			xml2Post.@ProviderName 			= ProviderName;
			xml2Post.@EncounterTypeName 	= EncounterTypeName;
			xml2Post.@PlaceofService 		= PlaceofService;

			service.url = service.url ;//+ "/" + VisitID + "/" + LoggedInUserSessionID + "/" + LoggedInUserSelectedBranchId + "/" + LoggedInUserSelectedStationID + "/" + isAllSelected + "/" + isPatientMale + "/" + IsTemplateVisit + "/" + gaxenID
				//+'/'+ model.VisitProviderName +'/'+ model.EncounterTypeName  +'/'+	model.placeOfServiceName;
			service.resultFormat = HTTPService.RESULT_FORMAT_E4X;
			service.send(xml2Post);	
			
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