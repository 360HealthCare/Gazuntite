package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetPatientPharmDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetPatientPharmEvent;
	import com.gazuntite.provider.eprescription.services.patient.event.LoadStaticDataEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetPatientPharmCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetPatientPharmDelegate;
		private var LE:GetPatientPharmEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			
			responder = new Responder(result, fault);				
			delegate  = new GetPatientPharmDelegate( responder );			
			
			var LE:GetPatientPharmEvent = cgEvent as GetPatientPharmEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetPharmacies(LE.patientID);
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
			Alert.show("Fault occured in GetPatientPharmCommand.\n"+rpcEvent.toString(),'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}