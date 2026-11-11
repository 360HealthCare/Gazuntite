package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;
	
	public class LoadTestTypeByNameEvent extends CairngormEvent
	{
		public var SearchName:String;
		public function LoadTestTypeByNameEvent(searchName:String)
		{
			super(ELabsController.LOAD_TEST_TYPE_BY_NAME, true, false);
			this.SearchName = searchName;
		}
	}
}