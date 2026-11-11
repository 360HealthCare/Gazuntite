package com.gazuntite.dictation.delegate
{
	
	import com.gazuntite.dictation.utils.DictationConstants;
	import com.gazuntite.dictation.utils.DictationServiceMethods;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadDictationByIdDelegate
	{
		private var responder	:IResponder;
		private var request		:URLRequest;
		private var dictationID:String;
		
		public function LoadDictationByIdDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			
			request 			= new URLRequest();
			
			/*service.contentType = "Text/Xml";
			service.method		= URLRequestMethod.GET;*/
		}
		
		public function LoadDictation( dictationId:String, SessionID:String ):void
		{
			this.dictationID = dictationId;
			var sndFile:File = getLocalDictationFile(dictationId);	
			
			var strSndPath:String = sndFile.nativePath;
			
			//var soundUrl:URLRequest = new URLRequest(); //"http://www.gazuntite.com:9001/test.wav"
			
			//chk if local exists
			if(sndFile != null && sndFile.exists)
			{
				request.url = strSndPath;
			}
			else // load from server
			{
				request.url = DictationConstants.RESTFULL_SERVICE_BASE_URL + DictationServiceMethods.LOAD_DICTATION_BY_ID + "/" + dictationId + "/"+ SessionID;
				request.method = URLRequestMethod.GET;
			}
			
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = 'binary';
			loader.load(request);
			
			loader.addEventListener(Event.COMPLETE, onResult);				
			loader.addEventListener(IOErrorEvent.IO_ERROR, onFault);

			trace('LoadDictationByIdDelegate', 'CALL SEND FOR RESULT' );
		}
		
		private function getLocalDictationFile( dictationId:String ):File
		{
			var wavFile:File = File.applicationStorageDirectory;
			wavFile = wavFile.resolvePath(DictationConstants.DICTATION_FILE_LOCAL_DIR + dictationId + DictationConstants.DICTATION_FILE_TYPE);
			
			return wavFile;
		}
		
		private function writeLocalFile( sndBytes:ByteArray ):void
		{
			var sndFile:File = getLocalDictationFile(dictationID);	
			
			if(sndFile != null && sndFile.exists == false)
			{
				var stream:FileStream = new FileStream();				
				stream.open(sndFile, FileMode.WRITE);
				stream.writeBytes(sndBytes, 0, sndBytes.bytesAvailable); 
				stream.close();
			}
		}
		
		private function onResult(event:Event):void
		{
			var sndBytes:ByteArray = new ByteArray();
			sndBytes = event.target.data as ByteArray;
			if( null != sndBytes && sndBytes.length )
				writeLocalFile( sndBytes );
			
			
			responder.result(event);
		}
		
		private function onFault(event:Event):void
		{
			responder.fault(event);			
		}
	}
}