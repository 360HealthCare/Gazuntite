package com.gazuntite.dictation.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.dictation.controller.DictationController;
	
	public class LoadDictationByIdEvent extends CairngormEvent
	{
		public var dictationID 			: String;
		public var sessionID 			: String;
		public var callBack			: Function;
		
		public function LoadDictationByIdEvent( dictationId:String, sessionId:String, callback:Function = null )
		{
			super( DictationController.LOAD_DICTATION_BY_ID_EVENT );
			this.dictationID 	= dictationId;
			this.sessionID 		= sessionId;
			this.callBack 		= callback;
		}
	}
}