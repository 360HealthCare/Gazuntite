package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.LoadPatientInsuancePatientIdDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.LoadPatientInsuancePatientIdEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPatientInsuancePatientIdCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:LoadPatientInsuancePatientIdDelegate;
		private var LE:LoadPatientInsuancePatientIdEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new LoadPatientInsuancePatientIdDelegate( responder );			
			
			var LE:LoadPatientInsuancePatientIdEvent = cgEvent as LoadPatientInsuancePatientIdEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetInsurance(LE.patientID);
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
			Alert.show("Fault occured in LoadPatientInsuancePatientIdCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}