package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.UpdateSubscribedUserDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.UpdateSubscribedUserEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class UpdateSubscribedUserCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:UpdateSubscribedUserDelegate;
		private var LE:UpdateSubscribedUserEvent;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new UpdateSubscribedUserDelegate( responder );			
			
			var LE:UpdateSubscribedUserEvent = cgEvent as UpdateSubscribedUserEvent;
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
			Alert.show("Fault occured in SubscribePatientCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}