package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.ValidatePracticeKeyDelegate;
	import com.gazuntite.common.event.ValidatePracticeKeyEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ValidatePracticeKeyCommand implements Command
	{
		private var responder:Responder;
		private var delegate:ValidatePracticeKeyDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new ValidatePracticeKeyDelegate( responder );			
			
			var LE:ValidatePracticeKeyEvent = cgEvent as ValidatePracticeKeyEvent;
			
			callBack = LE.callBack;			
			delegate.isValidKey(LE.practiceKey);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			callBack(event.result as XML);
		}
		
		private function onError(event:FaultEvent):void
		{			
			QSCombinedExceptionAlert.getInstance().Show( "Error in ValidatePracticeKeyCommand", event.toString(), 0); 
		}
	}
}