package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;
	
	public class ProcessLabResultEvent extends CairngormEvent
	{
		public var date:Date;
		public var dataXML:XML;
		
		public function ProcessLabResultEvent(dataXml:XML, processDate:Date)
		{
			super(ELabsController.PROCESS_RESULT_EVENT, true);
			this.date = processDate;
			this.dataXML = dataXml;
		}
	}
}