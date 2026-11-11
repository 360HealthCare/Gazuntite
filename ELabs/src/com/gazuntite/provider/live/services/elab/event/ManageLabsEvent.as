package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;
	import com.gazuntite.provider.live.services.elab.dto.ELabDTO;
	
	public class ManageLabsEvent extends CairngormEvent
	{
		public var Lab:ELabDTO;
		
		public function ManageLabsEvent(lab:ELabDTO)
		{
			super(ELabsController.MANAGE_ELABS, true, false);
			this.Lab = lab;
		}
	}
}