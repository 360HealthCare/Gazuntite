package com.zigron.gazuntite.event.rapidAccess
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	public class ManageQuickLinksEvent extends CairngormEvent
	{
		public static const MANAGE_QUICK_LINKS:String = "ManageQuickLinks";
		public var callBack:Function;
		public var isdefault:Boolean;
		
		public function ManageQuickLinksEvent(isdefault:Boolean, _callBack:Function)
		{
			super(GazuntiteClientController.MANAGE_QUICK_LINKS);
			this.callBack = _callBack;
			this.isdefault = isdefault;
		}
	}
}