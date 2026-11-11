package com.gazuntite.common.util.upload
{
	import flash.events.Event;
	
	public class FileStreamUploaderEvent extends Event
	{
		public static const FILE_STREAM_UPLOAD_COMPLETED_EVENT:String	= "fileStreamUploadCompleted";
		public static const FILE_STREAM_UPLOAD_FAILED_EVENT:String	= "fileStreamUploadFailed";
		
		public var data:Object;
		
		public function FileStreamUploaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}