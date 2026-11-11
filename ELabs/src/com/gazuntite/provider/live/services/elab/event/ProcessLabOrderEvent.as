package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;
	
	public class ProcessLabOrderEvent extends CairngormEvent
	{
		public var date:Date;
		public var dataXML:XML;
		public var func:Function;
		
		public function ProcessLabOrderEvent(dataXml:XML, processDate:Date, _func:Function)
		{
			super(ELabsController.PROCESS_ORDER_EVENT, true);
			this.date = processDate;
			this.dataXML = dataXml;
			this.func    = _func;
		}
	}
}