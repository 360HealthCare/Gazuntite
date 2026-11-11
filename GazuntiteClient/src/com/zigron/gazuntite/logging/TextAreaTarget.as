package com.zigron.gazuntite.logging
{
	import flash.net.getClassByAlias;
	import flash.system.Capabilities;
	import flash.utils.getDefinitionByName;
	
	import flashx.textLayout.elements.DivElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	
	import mx.core.ClassFactory;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.logging.LogEvent;
	import mx.logging.targets.LineFormattedTarget;
	
	import spark.components.TextArea;

	use namespace mx_internal;
	
	/**
	 * This class implements TextArea as Logging Target. 
	 * It provides different colors for every event level within the output.
	 * It also provide functionality to save file on the disk, log file is 
	 * saved at "app-storage:/log/quivusLog.log".
	 * 
	 * @inharit
	 * @author Malik Tamjeed
	 * 
	 */	
	
	public class TextAreaTarget extends LineFormattedTarget
	{
		private var console : TextArea;
		
		public function TextAreaTarget( console:TextArea )
		{
			super();
			this.console = console;
		}
		
		/**
		 * basic functionality required by the logging framework for a TextArea implementation.
		 * 
		 * @param message message String containing preprocessed log message which may
	     * include time, date, category, etc. based on property settings,
	     * such as <code>includeDate</code>, <code>includeCategory</code>,etc.
		 * 
		 */		
		mx_internal override function internalLog( message:String ):void
		{
			var p:ParagraphElement = new ParagraphElement();
			
			var color:uint = 0x000000;
			if(message.indexOf("[ERROR]") > 0)
			{
				color = 0xDD0000;
			}
			else if(message.indexOf("[WARN]") > 0)
			{
				color = 0xFF6600;
			}
			else if(message.indexOf("[INFO]") > 0)
			{
				color = 0x33FF00;
			}
			else if(message.indexOf("[DEBUG]") > 0)
			{
				color = 0x666666;
			}
			
			var msgSpan:SpanElement = new SpanElement();
			msgSpan.color = color;
			msgSpan.text = message;
			
			if ( this.console.textFlow == null)
			{
				this.console.textFlow = new TextFlow();
			}
			
			p.addChild(msgSpan);
			console.textFlow.addChild( p );
			
			/*this.console.scroller.callLater( 
				function():void
				{
					console.scroller.viewport.verticalScrollPosition = console.scroller.verticalScrollBar.maximum 
				}
			);*/
		}
		
		public function saveLogFile():Boolean
		{
			try
			{
				if( Capabilities.playerType == "Desktop" )
				{
					var fileClass:Class = getDefinitionByName( "flash.filesystem.File" ) as Class;
					var file:Object = new fileClass().resolvePath("app-storage:/log/quivusLog.log");
					
					var fileStreamClass:Class = getDefinitionByName( "flash.filesystem.FileStream" ) as Class;
					var fs:Object = new fileStreamClass();
					
					
					if( file && fs )
					{
						fs.open(file, "append");
						fs.writeUTFBytes(console.textFlow + "\n");
						fs.close();
						
						return true;
					}
				}
			}
			catch( e:Error )
			{
				trace( "Error Wrting File ", e.message );
			}
			
			return false;
		}
		
		override public function logEvent( event:LogEvent ):void
		{
			super.logEvent( event );
			trace( "FileTarget::logEvent", event.message );
		}
		
	}

}