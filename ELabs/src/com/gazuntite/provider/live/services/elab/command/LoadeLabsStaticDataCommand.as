package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.provider.live.services.elab.delegate.LoadeLabsStaticDataDelegate;
	import com.gazuntite.provider.live.services.elab.dto.LaboratoryListDTO;
	import com.gazuntite.provider.live.services.elab.dto.MethodListDTO;
	import com.gazuntite.provider.live.services.elab.dto.SearchFieldsListDTO;
	import com.gazuntite.provider.live.services.elab.event.LoadeLabsStaticDataEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadeLabsStaticDataCommand implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadeLabsStaticDataDelegate;
		private var LE:LoadeLabsStaticDataEvent;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadeLabsStaticDataDelegate( responder );			
			
			LE = cgEvent as LoadeLabsStaticDataEvent;
			
			delegate.LoadStaticData();
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var result:XML = event.result as XML;
			var xStatus:XML = result.Status[0];
			var type:String = xStatus.@[XmlConstants.TYPE];
			if( type.toLowerCase() == "success")
			{
				var xFields:XMLList = result.Fields;
				var xCommonFields:XML = xFields.(@Type == 'Common')[0];
				var xResultFields:XML = xFields.(@Type == 'Result')[0];
				
				var osfl:SearchFieldsListDTO = new SearchFieldsListDTO();
				osfl.FromXML( xCommonFields );
				model.OrderSearchFieldsList = osfl;
				model.CommonSearchFieldsList = osfl;
				
				var rsfl:SearchFieldsListDTO = new SearchFieldsListDTO();
				rsfl.FromXML( xResultFields );
				rsfl.Fields.addAll( osfl.Fields ); //merge all ( common + result  specific )
				model.ResultSearchFieldsList = rsfl;
				
				var ll:LaboratoryListDTO = new LaboratoryListDTO;
				var xLaboratoryList:XMLList = result.Labs;
				ll.FromXML( xLaboratoryList[0] );
				model.LaboratoryListDto = ll;
				
				var methodList:MethodListDTO = new MethodListDTO;
				var xMethodList:XMLList = result.Methods;
				methodList.FromXML( xMethodList[0] );
				model.MethodListDto = methodList;
			}
			else
			{
				Alert.show("LoadStaticData\nServer Responded with status type " + 
							type + "\n server status message is " + xStatus.@[XmlConstants.MESSAGE], 
							"Response status " + type );
			}
			trace( event.result );
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in LoadStaticData.";
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), model.LoggedInUserId ); 
		}
	}
}