package com.gazuntite.provider.eprescription.services.patient.command.billing
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.billing.ManageProviderInsuranceDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.billing.ManageProviderInsuranceEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	import com.gazuntite.provider.eprescription.services.patient.util.PSConstants;
	
	import flash.display.Sprite;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class ManageProviderInsuranceCommand implements Command
	{
		private var model			: EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		private var responder		:Responder;
		private var delegate		:ManageProviderInsuranceDelegate;
		private var callBack		:Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder   = new Responder(onSuccess,onError);
			delegate	= new ManageProviderInsuranceDelegate(responder);
			
			var LE:ManageProviderInsuranceEvent = cgEvent as  ManageProviderInsuranceEvent;
			
			callBack = LE.callBack;
			
			delegate.ManageProviderInsurance(LE.xmlData);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			if( null != callBack )
				callBack(new XML(event.message.body.toString()));
		}
		
		private function onError(event:FaultEvent):void
		{			
			Alert.show("Received In ManageProviderInsuranceCommand.\n" + event.toString(), PSConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}