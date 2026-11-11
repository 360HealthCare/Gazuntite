package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.SaveAddressDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.SaveAddressEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class SaveAddressCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:SaveAddressDelegate;
		private var LE:SaveAddressEvent;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new SaveAddressDelegate( responder );			
			
			var LE:SaveAddressEvent = cgEvent as SaveAddressEvent;
			
			callBack = LE.functionName;
			
			var d:Date = new Date();
			delegate.SaveAddress(LE.data,  LE.userID, d);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			if( null != callBack )
				callBack(new XML(rpcEvent.message.body.toString()) );
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in SaveAddressCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}