package com.gazuntite.provider.eprescription.services.patient.command.billing
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.billing.GetProviderInsuranceDelegate;
	import com.gazuntite.provider.eprescription.services.patient.dto.billing.ProviderInsuranceDTO;
	import com.gazuntite.provider.eprescription.services.patient.event.billing.GetProviderInsuranceEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	import com.gazuntite.provider.eprescription.services.patient.util.PSConstants;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class GetProviderInsuranceCommand implements Command
	{
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:GetProviderInsuranceDelegate;		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new GetProviderInsuranceDelegate( responder );			
			
			var LE:GetProviderInsuranceEvent = cgEvent as GetProviderInsuranceEvent;
			
			callBack = LE.callBack;
			
			delegate.GetProviderInsuranceList( LE.userId, LE.clinicBranchId );
			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )
			
			var list:ArrayCollection = new ArrayCollection();		
			var x:XML = event.result as XML;
			var xPIs:XMLList = x.ProviderInsurances.ProviderInsurance;
			var i:int = 0;					
			for( i = 0; i < xPIs.length(); i++ )
			{
				var c:ProviderInsuranceDTO = new ProviderInsuranceDTO();
				c.FromXML( xPIs[i][0] );
				list.addItem( c );
			}
			
			model.ProviderInsuranceList = list;		
			
			trace( "model updated "  )
			
			if( null != callBack )
				callBack();			
			
			trace( " after callBack() "  )
			
			trace( "on result found record ", list.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Received In GetProviderInsuranceCommand.\n" + event.toString(), PSConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}