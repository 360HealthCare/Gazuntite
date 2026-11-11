package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.UpdateUserDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.UpdateUserEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class UpdateUserCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:UpdateUserDelegate;
		private var LE:UpdateUserEvent;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new UpdateUserDelegate( responder );			
			
			var LE:UpdateUserEvent = cgEvent as UpdateUserEvent;
			callBack = LE.functionName;
			
			delegate.UpdateUser(LE.xml);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			if( null != callBack )
				callBack(new XML(rpcEvent.message.body.toString()) );
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in UpdateUserCommand.\n"+rpcEvent.toString(), 'info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}