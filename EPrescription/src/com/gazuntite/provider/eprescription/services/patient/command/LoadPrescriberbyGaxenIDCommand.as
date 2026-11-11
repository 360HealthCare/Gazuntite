package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.LoadPrescriberbyGaxenIDDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.LoadPrescriberbyGaxenIDEvent;

	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPrescriberbyGaxenIDCommand  implements com.adobe.cairngorm.commands.Command, IResponder
	{
		private var responder:Responder;
		private var delegate:LoadPrescriberbyGaxenIDDelegate;
		private var LE:LoadPrescriberbyGaxenIDEvent;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void
		{
			responder = new Responder(result, fault);				
			delegate  = new LoadPrescriberbyGaxenIDDelegate( responder );			
			
			var LE:LoadPrescriberbyGaxenIDEvent = cgEvent as LoadPrescriberbyGaxenIDEvent;
			
			callBack = LE.functionName;
			var d:Date = new Date();
			delegate.LoadPrescriber(LE.data, LE.gaxenId, d);
		}
		
		public function result( rpcEvent : Object ) : void
		{
			if( null != callBack )
				callBack(new XML(rpcEvent.message.body.toString()) );
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in LoadPrescriberbyGaxenIDCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}