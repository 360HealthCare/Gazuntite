package com.gazuntite.provider.live.services.billing.superBill.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.superBill.delegate.LoadCPTModifierTypesDelegate;
	import com.gazuntite.provider.live.services.billing.superBill.dto.CPTModifierTypeDTO;
	import com.gazuntite.provider.live.services.billing.superBill.event.LoadCPTModifierTypesEvent;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadCPTModifierTypesCommand implements Command
	{
		private var model : SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadCPTModifierTypesDelegate;		
		private var callBack			: Function;
		private var modifierNo:int	;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadCPTModifierTypesDelegate( responder );			
			
			var LE:LoadCPTModifierTypesEvent = cgEvent as LoadCPTModifierTypesEvent;
			
			callBack = LE.callBack;
			
			delegate.CPTModifierTypeList(LE.modifierCode );
			this.modifierNo = LE.modifierNo
						
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			var xCPTModifierTypes:XMLList = ResultXml.CPTModifierTypes.CPTModifierType;
			var i:int = 0;					
			for( i = 0; i < xCPTModifierTypes.length(); i++ )
			{
				var ct:CPTModifierTypeDTO = new CPTModifierTypeDTO();
				ct.FromXML( xCPTModifierTypes[i][0] );
				Types.addItem( ct );
			}	
						
				model.CPTModifierTypeList1 = Types;	
				model.CPTModifierTypeList2 = Types;
				model.CPTModifierTypeList3 = Types;
				model.CPTModifierTypeList4 = Types;
			
			trace( "model updated "  )
			
			if( null != callBack )
				callBack();			
			
			//trace( " after callBack() "  )
			
			trace( "on result found record ", Types.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Received In LoadCPTModifierTypesCommand.\n" + event.toString(), SuperBillConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}