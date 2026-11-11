package com.gazuntite.common.util
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.flash_proxy;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;

	public class DocumentLoader
	{
		private var loader:URLLoader;
		private var documentUrl:String;
		private var documentFile:File;
		private var _documentName:String;
		private var _documentLoadCallBack:Function;
		
		private var tempDir:File;
		
		public function DocumentLoader()
		{
			loader = new URLLoader();
			
			tempDir = File.createTempDirectory();
		}
		
		public function load(name:String, url:String):void
		{
			documentName = name;
			documentUrl = url;
			
			loadDoc();
		}
		
		private function loadDoc():void
		{
			if (!documentUrl)
				return;
			
			if (!documentUrl.length)
				return;
			
			CursorManager.setBusyCursor();
			
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			loader.addEventListener(Event.COMPLETE, onDocumentLoadingComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onDocumentLoadingError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onDocumentLoadingError);
			
			var urlRequest:URLRequest = new URLRequest(documentUrl);
			loader.load(urlRequest);
		}
		
		private function onDocumentLoadingComplete(event:Event):void
		{
			if (!documentUrl)
				return;
			
			if (!documentUrl.length)
				return;
			
			var splittedDocumentUrl:Array = documentUrl.split(".");
			
			var documentExtension:String = splittedDocumentUrl[splittedDocumentUrl.length - 1];
			
			if (documentName.indexOf(".") == -1)
			{
				documentName += "." + documentExtension;
			}
			
			try
			{
				documentFile = tempDir.resolvePath(documentName);
				
				var fs:FileStream = new FileStream();
				fs.open(documentFile, FileMode.WRITE);
				
				fs.writeBytes(loader.data);
				
				fs.close();
				
				documentFile.downloaded = true;
				
				documentLoadCallBack(documentFile);
			}
			catch(error:Error)
			{
				Alert.show("unable to open file \"" + documentName + "\" \n" + error.message, "Unknown File Type" );
			}
		}
		
		private function onDocumentLoadingError(event:IOErrorEvent):void
		{
			Alert.show("Unable to download" + documentUrl, "Error");
			
			CursorManager.removeBusyCursor();
		}
		
		public function get documentLoadCallBack():Function
		{
			return _documentLoadCallBack;
		}

		public function set documentLoadCallBack(value:Function):void
		{
			_documentLoadCallBack = value;
		}

		public function get documentName():String
		{
			return _documentName;
		}

		public function set documentName(value:String):void
		{
			_documentName = value;
		}
	}
}