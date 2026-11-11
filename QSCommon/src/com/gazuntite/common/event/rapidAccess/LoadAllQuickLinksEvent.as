package com.gazuntite.common.event.rapidAccess
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadAllQuickLinksEvent extends CairngormEvent
	{
		public static const LOAD_ALL_QUICK_LINKS:String = "LoadAllQuickLinks";
		public var func:Function;
		
		public function LoadAllQuickLinksEvent(_func:Function)
		{
			super(QSCommonController.LOAD_ALL_QUICK_LINKS);
			this.func = _func;
		}
	}
}