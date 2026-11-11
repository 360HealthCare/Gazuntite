package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.LoadPlaceOfServiceTypesDelegate;
	import com.gazuntite.common.dto.PlaceOfServiceTypeDTO;
	import com.gazuntite.common.event.LoadPlaceOfServiceTypesEvent;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadPlaceOfServiceTypesCommand implements Command
	{
		private var responder:Responder;
		private var delegate:LoadPlaceOfServiceTypesDelegate;		
		private var callBack			: Function;
		private var LE:LoadPlaceOfServiceTypesEvent
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadPlaceOfServiceTypesDelegate( responder );			
			
			LE = cgEvent as LoadPlaceOfServiceTypesEvent;
			
			callBack = LE.callBack;
			if( ! UtilityFunctions.IsNullOrEmpty( LE.typeName ) )
			{				
				delegate.PlaceOfServiceTypeList( LE.typeName );				
			}			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection 	= new ArrayCollection();
			var ResultXml:XML 			= event.result as XML
			var xPOSTypes:XMLList 		= ResultXml.POSTypes.POSType;
			var i:int = 0;					
			for( i = 0; i < xPOSTypes.length(); i++ )
			{
				var ct:PlaceOfServiceTypeDTO = new PlaceOfServiceTypeDTO();
				ct.FromXML( xPOSTypes[i][0] );
				Types.addItem( ct );
			}		
			
			callBack ( Types );
			
			trace( "on result found record ", Types.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Received In LoadPlaceOfServiceTypesCommand";
			
			
			var userId:int = -1;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
		}
	}
}