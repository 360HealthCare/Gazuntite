package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.UpdateGaxenIDDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.UpdateGaxenIDEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class UpdateGaxenIDCommand  implements com.adobe.cairngorm.commands.Command, IResponder 
	{
		private var responder:Responder;
		private var delegate:UpdateGaxenIDDelegate;
		private var LE:UpdateGaxenIDEvent;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new UpdateGaxenIDDelegate( responder );			
			
			LE = cgEvent as UpdateGaxenIDEvent;
			var d:Date = new Date();
			delegate.SaveGaxenId(LE.userId, LE.gaxenId, d);
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(LE.functionName)
				LE.functionName();
			//return;
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in SaveGaxenIdCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}