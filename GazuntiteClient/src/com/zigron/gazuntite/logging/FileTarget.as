package com.zigron.gazuntite.logging
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileReference;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.utils.ByteArray;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	
	import mx.core.mx_internal;
	import mx.formatters.DateFormatter;
	import mx.logging.AbstractTarget;
	import mx.logging.LogEvent;
	import mx.logging.targets.LineFormattedTarget;
	import mx.utils.StringUtil;
	
	use namespace mx_internal;
	
	public class FileTarget extends LineFormattedTarget
	{
		public const DEFAULT_LOG_PATH:String = "app-storage:/log/GazuntiteClient";
		
		private var log:File;
		
		public function FileTarget(logFile:File = null)
		{
			if(logFile != null)
			{
				log = logFile;
			}
			else
			{
				log = new File( DEFAULT_LOG_PATH + ".html");
				if( log.exists )
				{
					var d:Date = new Date();
					var backUpPath:String = DEFAULT_LOG_PATH + "_" + ( d.month + 1 ) + "" + d.date + "" + d.fullYear + "_" + d.hours + "" + d.minutes + ".html";
					var destination:File = new File( backUpPath );
					log.moveTo( destination, true );
					
					var fs:FileStream = new FileStream();
					fs.open( log, FileMode.WRITE );
					fs.writeUTFBytes( MessageFormat.HEADER );
					var df:DateFormatter = new DateFormatter();
					df.formatString = "EEEE, MMM. D, YYYY at H:NN:SS A";
					fs.writeUTFBytes( StringUtil.substitute( MessageFormat.BODY, df.format( new Date() ) ) );
					fs.close();
				}
			}
		}
		
		public function get logURI():String
		{
			return log.url;
		}
		
		mx_internal override function internalLog(message:String):void
		{
			write(message);
		}	
		
		override public function logEvent(event:LogEvent):void
		{
			super.logEvent( event );
			//trace( "FileTarget::logEvent", event.message );
		}
		
		private function write(message:String):void
		{		
			message = EscapeXML( message );
			if( message.indexOf("[FATAL]") > 0 )
			{
				message = StringUtil.substitute( MessageFormat.MESSAGE, message, "fatal" );
			}
			else if( message.indexOf("[ERROR]") > 0 )
			{
				message = StringUtil.substitute( MessageFormat.MESSAGE, message, "error" );
			}
			else if( message.indexOf("[WARN]") > 0 )
			{
				message = StringUtil.substitute( MessageFormat.MESSAGE, message, "warn" );
			}
			else if( message.indexOf("[INFO]") > 0 )
			{
				message = StringUtil.substitute( MessageFormat.MESSAGE, message, "info" );
			}
			else if( message.indexOf("[DEBUG]") > 0 )
			{
				message = StringUtil.substitute( MessageFormat.MESSAGE, message, "debug" );
			}
			
			var fs:FileStream = new FileStream();
			fs.open( log, FileMode.APPEND );
			fs.writeUTFBytes( message + "\n" );
			fs.close();
		}	
		
		private function EscapeXML(str:String):String
		{
			XML.prettyPrinting = true;
			return XML(new XMLNode(XMLNodeType.TEXT_NODE, str)).toXMLString();
		}
		
		public function clear():void
		{
			var fs:FileStream = new FileStream();
			fs.open(log, FileMode.WRITE);
			fs.writeUTFBytes("");
			fs.close();			
		}
		
	}
}