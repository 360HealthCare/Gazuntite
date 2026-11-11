package com.gazuntite.provider.search.services.provider.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSExceptionAlert;
	import com.gazuntite.provider.search.services.provider.delegate.SearchProviderDelegate;
	import com.gazuntite.provider.search.services.provider.dto.SearchProviderResultsList;
	import com.gazuntite.provider.search.services.provider.event.SearchProviderEvent;
	import com.gazuntite.provider.search.services.provider.model.SearchProviderModelLocator;
	import com.gazuntite.provider.search.services.provider.util.PSConstants;
	
	import flash.display.Sprite;
	import flash.xml.XMLDocument;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;
	import mx.utils.ObjectProxy;
	
	
	
	
	public class SearchProviderCommand implements Command
	{
		
		private var model : SearchProviderModelLocator = SearchProviderModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:SearchProviderDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new SearchProviderDelegate( responder );			
			
			var LE:SearchProviderEvent = cgEvent as SearchProviderEvent;
			
			callBack = LE.callBack;
				delegate.SearchProviderList( model.LoggedInUserSelectedBranchId);
			
			var d:Date = new Date();
			trace( "time call sent " + d.minutes, d.seconds )
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			/* Convert XMLNode to XMLDocument. */
			var xmlStr:String = event.result.toString();
			var xmlDoc:XMLDocument = new XMLDocument(xmlStr);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
			var resultObj:Object = decoder.decodeXML(xmlDoc);
			/* Assign the values... */
			
			//var s:String = resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[0].FirstName;
			
			//var re:ResultEvent = event as ResultEvent;
			//var dto:ObjectProxy	=  event.result.ArrayOfContactSearchDTO  re.result.ResponseData.ContactSearchDTO.IsDeleted as ObjectProxy;
			
			var psl:SearchProviderResultsList = new SearchProviderResultsList();
			psl.FromXML( event.result as XML );
			model.SearchProviderResults =psl;
			event.stopImmediatePropagation();
			/*
			var d:Date = new Date();
			trace( "time onSuccess start " + d.minutes, d.seconds )
			
			var psl:SearchProviderResultsList = new SearchProviderResultsList();
			psl.FromXML( event.result as XML );
			
			model.SearchPatientResults = psl;
			
			var d:Date = new Date();
			trace( "time model updated " + d.minutes, d.seconds )
			
			if( null != callBack )
				callBack();
			
			var d:Date = new Date();
			trace( "time after callBack() " + d.minutes, d.seconds )
			
			trace( "on result fond record ", psl.Patients.length );
			*/
			if( null != callBack )
				callBack();
			
			
			/*
			var re:ResultEvent = rpcEvent as ResultEvent;
			
			var csDTO:ContactSearchResponse = re.result as ContactSearchResponse;
			if(csDTO!=null)
			{
				if(csDTO.ResponseStatus)
				{
					if(csDTO.ResponseData!=null)
					{
						model.contactSearchSuggestionList = csDTO.ResponseData;
					}
					else
					{
						Alert.show(Messages.NO_DATA_RETURNED_FROM_SERVICE, Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					}
				}
				else
				{
					model.errorStatus = csDTO.ResponseMessage ;
					var valid:Boolean = QSUtilityFunctions.checkSession(csDTO.ResponseCode);
					if(valid)
						Alert.show(csDTO.ResponseMessage, Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
				}
			///
			*/
		}
		
		private function onError(event:FaultEvent):void
		{
			var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error in Search Provider ",event.fault.faultString,model.LoggedInUserId);
			PopUpManager.centerPopUp(cAlert); 
			//Alert.show("Received In SearchProviderCommand.\n" + event.toString(), PSConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}