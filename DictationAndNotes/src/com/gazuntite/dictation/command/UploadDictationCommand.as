package com.gazuntite.dictation.command
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.dictation.delegate.UploadDictationDelegate;
	import com.gazuntite.dictation.event.UploadDictationEvent;
	import com.gazuntite.dictation.model.DictationModelLocator;
	
	import flash.events.Event;
	
	import mx.rpc.IResponder;
	
	public class UploadDictationCommand implements Command, IResponder
	{
		private var model : DictationModelLocator = DictationModelLocator.getInstance();
		
		private var delegate:UploadDictationDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			delegate  = new UploadDictationDelegate( this );		
			
			var LE:UploadDictationEvent = cgEvent as UploadDictationEvent;
			
			callBack = LE.callBack;
			
			delegate.UploadDictation(LE.soundBytes, LE.dictationId, LE.sessionId, LE.recordTimeStamp, LE.createdAt, LE.createdBy);
		}
		
		public function result(data:Object):void
		{
			trace(data.toString());
			if(null != callBack)
				callBack();
		}
		
		public function fault(data:Object):void
		{
			var errorStatus:String = "Received In UploadDictationCommand.\n";
			//QSCombinedExceptionAlert.getInstance().Show( errorStatus, data.toString() +"\n", model.LoggedInUserId); 
		}
	}
}