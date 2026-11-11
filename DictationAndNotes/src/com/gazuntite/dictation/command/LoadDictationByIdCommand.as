package com.gazuntite.dictation.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.dictation.delegate.LoadDictationByIdDelegate;
	import com.gazuntite.dictation.event.LoadDictationByIdEvent;
	import com.gazuntite.dictation.model.DictationModelLocator;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadDictationByIdCommand implements Command
	{
		private var model : DictationModelLocator = DictationModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadDictationByIdDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadDictationByIdDelegate( responder );			
		
			var LE:LoadDictationByIdEvent = cgEvent as LoadDictationByIdEvent;
			
			callBack = LE.callBack;

			delegate.LoadDictation( LE.dictationID, LE.sessionID );
		}
			
		private function onSuccess(event:Event):void
		{
			var sndBytes:ByteArray = new ByteArray();
			sndBytes = event.target.data as ByteArray;
			
			if( null != callBack )
				callBack(sndBytes);
		}
		
		private function onError(event:Event):void
		{
			var errorStatus:String = "Received In LoadDictationByIdCommand.\n";
			//QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString() +"\n", model.LoggedInUserId); 
		}
	}
}