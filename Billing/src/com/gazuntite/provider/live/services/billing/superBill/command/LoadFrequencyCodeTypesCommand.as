package com.gazuntite.provider.live.services.billing.superBill.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.superBill.delegate.LoadFrequencyCodeTypesDelegate;
	import com.gazuntite.provider.live.services.billing.superBill.dto.FrequencyCodeTypeDTO;
	import com.gazuntite.provider.live.services.billing.superBill.event.LoadFrequencyCodeTypesEvent;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadFrequencyCodeTypesCommand implements Command
	{
		private var model : SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadFrequencyCodeTypesDelegate;		
		//private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadFrequencyCodeTypesDelegate( responder );			
			
			var LE:LoadFrequencyCodeTypesEvent = cgEvent as LoadFrequencyCodeTypesEvent;
			
			//callBack = LE.callBack;
			if( LE != null )
			{				
				delegate.FrequencyCodeTypeList();				
			}			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			var xFrequencyCodeTypes:XMLList = ResultXml.FrequencyCodeTypes.FrequencyCodeType;
			var i:int = 0;					
			for( i = 0; i < xFrequencyCodeTypes.length(); i++ )
			{
				var ct:FrequencyCodeTypeDTO = new FrequencyCodeTypeDTO();
				ct.FromXML( xFrequencyCodeTypes[i][0] );
				Types.addItem( ct );
			}		
			
			//model.FrequencyCodeList = Types;
			
			trace( "model updated "  )
			
			//if( null != callBack )
			//callBack();			
			
			//trace( " after callBack() "  )
			
			trace( "on result found record ", Types.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Received In LoadENMCodeTypesCommand.\n" + event.toString(), SuperBillConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}