package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.event.GetPatientGaxenIdEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetPatientGaxenIdDelegate;
	
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetPatientGaxenIdCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetPatientGaxenIdDelegate;
		private var LE:GetPatientGaxenIdEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			
			responder = new Responder(result, fault);				
			delegate  = new GetPatientGaxenIdDelegate( responder );			
			
			var LE:GetPatientGaxenIdEvent = cgEvent as GetPatientGaxenIdEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetGaxenId(LE.patientID);
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
			Alert.show("Fault occured in GetPatientGaxenIdCommand.\n"+rpcEvent.toString());
		}
	}
}