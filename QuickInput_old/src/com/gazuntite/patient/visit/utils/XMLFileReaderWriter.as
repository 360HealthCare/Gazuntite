package com.gazuntite.patient.visit.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class XMLFileReaderWriter
	{
		private var file:File;
		
		private var _content:XML;
		public function get content():XML
		{
			return _content;
		}

		public function set content(value:XML):void
		{
			_content = value;
			trace(value.toXMLString());
		}

		
		public function XMLFileReaderWriter(fileName:String)
		{
			file = File.applicationStorageDirectory.resolvePath( fileName );
		}
		
		public function read():void
		{
			if( file.exists )
			{
				var fs:FileStream = new FileStream();
				fs.open(file, FileMode.READ);
				content = XML(fs.readUTFBytes(fs.bytesAvailable));
				fs.close();
			}
		}
		
		public function write():void
		{
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.WRITE);
			fs.writeUTFBytes( "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + content.toXMLString() );
			fs.close();
		}
		
		public function append( value:XML ):void
		{
			content.appendChild( value );
		}
	}
}