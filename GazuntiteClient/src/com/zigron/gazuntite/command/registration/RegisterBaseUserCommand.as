package com.zigron.gazuntite.command.registration
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.zigron.gazuntite.delegate.registration.RegisterBaseUserDelegate;
	import com.zigron.gazuntite.event.registration.RegisterBaseUserEvent;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class RegisterBaseUserCommand implements Command
	{
		private var responder:Responder;
		private var delegate:RegisterBaseUserDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);	
			delegate = new RegisterBaseUserDelegate(responder);
			var LE:RegisterBaseUserEvent = cgEvent as RegisterBaseUserEvent;
			
			callBack = LE.callBack;
			delegate.RegisterBaseUser(LE.baseUserDTO);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			callBack(event.result as XML);
		}
		
		private function onError(event:FaultEvent):void
		{			
			QSCombinedExceptionAlert.getInstance().Show( "Error in RegisterBaseUserCommand", event.toString(), 0); 
		}
	}
}