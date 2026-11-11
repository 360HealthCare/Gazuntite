package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.SubscribePatientDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.SubscribePatientEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class SubscribePatientCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:SubscribePatientDelegate;
		private var LE:SubscribePatientEvent;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new SubscribePatientDelegate( responder );			
			
			var LE:SubscribePatientEvent = cgEvent as SubscribePatientEvent;
			callBack = LE.functionName;
			var d:Date = new Date();
			delegate.SubscribePatient(LE.data, LE.updateAdd, d);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			if( null != callBack )
				callBack(new XML(rpcEvent.message.body.toString()) );
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in SubscribePatientCommand.\n"+rpcEvent.toString());
		}
	}
}