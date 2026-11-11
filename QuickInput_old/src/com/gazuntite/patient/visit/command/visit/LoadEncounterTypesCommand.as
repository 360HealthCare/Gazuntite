package com.gazuntite.patient.visit.command.visit
{
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.visit.LoadEncounterTypesDelegate;
	import com.gazuntite.patient.visit.dto.EncounterTypeDTO;
	import com.gazuntite.patient.visit.event.visit.LoadEncounterTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadEncounterTypesCommand implements Command
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadEncounterTypesDelegate;		
		//private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadEncounterTypesDelegate( responder );			
			
			var LE:LoadEncounterTypesEvent = cgEvent as LoadEncounterTypesEvent;
			
			//callBack = LE.callBack;
			if( LE != null )
			{				
				delegate.EncounterTypeList();				
			}			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			var xEncounterTypes:XMLList = ResultXml.TOSTypes.TOSType;
			var i:int = 0;					
			for( i = 0; i < xEncounterTypes.length(); i++ )
			{
				var ct:EncounterTypeDTO = new EncounterTypeDTO();
				ct.FromXML( xEncounterTypes[i][0] );
				Types.addItem( ct );
			}		
			
			model.encounterTypeDTOList = Types;
			
			trace( "model updated "  )
			
			//if( null != callBack )
			//callBack();			
			
			//trace( " after callBack() "  )
			
			trace( "on result found record ", Types.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Received In LoadEncounterTypesCommand.\n" + event.toString(), 'BillingConstants.ERROR', 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}