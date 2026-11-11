package com.gazuntite.provider.live.services.scheduler.util
{
	public class SchedulerXmlUtils
	{
		public static function getNodeByTagName(tagName:String):XML
		{
			return new XML(  "<" + tagName + "/>" ); //return  <tagename    />
		}
		 
	}
}