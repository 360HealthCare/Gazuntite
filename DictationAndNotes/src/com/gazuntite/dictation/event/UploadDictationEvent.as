package com.gazuntite.dictation.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.dictation.controller.DictationController;
	
	import flash.utils.ByteArray;

	public class UploadDictationEvent extends CairngormEvent
	{
		public var soundBytes			:ByteArray;
		public var dictationId 			: String;
		public var sessionId 			: String;
		public var recordTimeStamp		: String;
		public var createdAt			: String;
		public var createdBy			: String;
		public var callBack				: Function;
		
		public function UploadDictationEvent( soundBytes:ByteArray, dictationId:String, sessionID:String, recordTimeStamp:String, createdAt:String, createdBy:String, callback:Function = null )
		{
			super( DictationController.UPLOAD_DICTATION_EVENT );
			
			this.soundBytes 	= soundBytes;
			this.dictationId 	= dictationId;
			this.sessionId		= sessionID;
			this.recordTimeStamp= recordTimeStamp; 
			this.createdAt		= createdAt;
			this.createdBy		= createdBy;
			this.callBack 		= callback;
		}
	}
}