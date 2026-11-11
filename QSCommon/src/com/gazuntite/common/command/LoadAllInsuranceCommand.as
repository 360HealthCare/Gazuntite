package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.LoadAllInsuranceDelegate;
	import com.gazuntite.common.dto.InsOrganizationDTO;
	import com.gazuntite.common.event.LoadAllInsuranceEvent;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadAllInsuranceCommand implements Command
	{
		//private var model : BillingModelLocator = BillingModelLocator.getInstance();		
		private var responder:Responder;
		private var delegate:LoadAllInsuranceDelegate;		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllInsuranceDelegate( responder );			
			
			var LE:LoadAllInsuranceEvent = cgEvent as LoadAllInsuranceEvent;
			
			callBack = LE.callBack;
			
			delegate.InsuranceList();
			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			var xInsurances:XMLList = ResultXml.Insurances.CMInsurance;
			var i:int = 0;					
			for( i = 0; i < xInsurances.length(); i++ )
			{
				var ct:InsOrganizationDTO = new InsOrganizationDTO();
				ct.FromXML( xInsurances[i][0] );
				Types.addItem( ct );
			}			
			
			trace( "model updated "  )
			
			if( null != callBack )
			callBack(Types);			
			
			trace( "on result found record ", Types.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			//Alert.show("Received In LoadAllInsuranceCommand.\n" + event.toString(), QSConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
			QSCombinedExceptionAlert.getInstance().Show( "Error in LoadAllInsuranceCommand", event.toString(), 0); 
		}
	}
}