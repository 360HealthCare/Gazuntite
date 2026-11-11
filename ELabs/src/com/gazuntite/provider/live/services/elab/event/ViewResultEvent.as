package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;
	
	public class ViewResultEvent extends CairngormEvent
	{
		public var callBack:Function;
		public var OID:String;
		
		public function ViewResultEvent( OID:String, callBack:Function)
		{
			super(ELabsController.VIEW_RESULT, true, false);
			this.callBack = callBack;
			this.OID = OID;
		}
	}
}