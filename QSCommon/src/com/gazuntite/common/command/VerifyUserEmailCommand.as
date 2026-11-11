package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.VerifyUserEmailDelegate;
	import com.gazuntite.common.event.VerifyUserEmailEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class VerifyUserEmailCommand  implements Command
	{
		private var responder:Responder;
		private var delegate:VerifyUserEmailDelegate;
		
		private var callBack			: Function;
				
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new VerifyUserEmailDelegate( responder );			
			
			var LE:VerifyUserEmailEvent = cgEvent as VerifyUserEmailEvent;
			
			callBack = LE.callBack;			
			delegate.isUniqueEmail(LE.email,LE.isUserName);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			callBack(event.result as XML);
		}
		
		private function onError(event:FaultEvent):void
		{			
			QSCombinedExceptionAlert.getInstance().Show( "Error in VerifyUserEmailCommand", event.toString(), 0); 
		}
	}
}