package com.gazuntite.provider.eprescription.services.patient.command.rx
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.rx.GetPatientHistoryMedDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.rx.GetPatientHistoryMedEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetPatientHistoryMedCommand implements Command
	{
		private var responder:Responder;
		private var delegate:GetPatientHistoryMedDelegate;
		private var LE:GetPatientHistoryMedEvent;
		private var callBack: Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(result, fault);				
			delegate  = new GetPatientHistoryMedDelegate( responder );			
			
			var LE:GetPatientHistoryMedEvent = event as GetPatientHistoryMedEvent;
			
			callBack = LE.callBack;
			
			delegate.GetPatientHistoryMed(LE.encounterID, LE.gaxenID);
		}
		
		public function result( rpcEvent : ResultEvent ) : void
		{										
			if( null != callBack )
			{
				callBack(new XML(rpcEvent.message.body.toString()));
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in GetPatientHistoryMedCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}