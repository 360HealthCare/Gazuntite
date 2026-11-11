package com.gazuntite.common.util
{
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;

	public final class LoggingUtil
	{
		public static const LOG_LEVEL_ALL						:String		= "all";
		public static const LOG_LEVEL_INFO						:String		= "info";
		public static const LOG_LEVEL_DEBUG						:String		= "debug";
		public static const LOG_LEVEL_WARNING					:String		= "warning";
		public static const LOG_LEVEL_ERROR						:String		= "error";
		public static const LOG_LEVEL_FATAL						:String		= "fatal";
		
		public static function getLogger(value:*):ILogger 
		{
			var className:String =  getQualifiedClassName( value ).replace("::", ".");
			return Log.getLogger(className);
		}
		
		public static function getLogLevel(level:String):int 
		{
			level = level.toLowerCase();
			
			if( level == LOG_LEVEL_ALL )
				return LogEventLevel.ALL;
			else if( level == LOG_LEVEL_INFO )
				return LogEventLevel.INFO;
			else if( level == LOG_LEVEL_DEBUG )
				return LogEventLevel.DEBUG;
			else if( level == LOG_LEVEL_WARNING )
				return LogEventLevel.WARN;
			else if( level == LOG_LEVEL_ERROR )
				return LogEventLevel.ERROR;
			else if( level == LOG_LEVEL_FATAL )
				return LogEventLevel.FATAL;
			
			//this line must not execute
			return -1;
		}
	}
}