package com.gazuntite.common.view.events
{
	
	import flash.events.Event;
	
	public class OpenFileOrWithNativeAppEvent extends Event
	{
		private var m_sFileName:String;
		private var m_sFileURL:String;
		
		public static const VIEW_DOCUMENT		:String = "viewDocument";
		
		
		public function OpenFileOrWithNativeAppEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super( VIEW_DOCUMENT, bubbles, cancelable);
		}

		public function get FileName():String
		{
			return m_sFileName;
		}

		public function set FileName(value:String):void
		{
			m_sFileName = value;
		}

		public function get FileURL():String
		{
			return m_sFileURL;
		}

		public function set FileURL(value:String):void
		{
			m_sFileURL = value;
		}


	}
}