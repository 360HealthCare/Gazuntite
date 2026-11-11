package com.zigron.gazuntite.event.registration
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.baseDTO.BaseUserDTO;
	import com.zigron.gazuntite.controller.GazuntiteClientController;

	public class RegisterBaseUserEvent extends CairngormEvent
	{
		public var baseUserDTO:BaseUserDTO;
		public var callBack:Function;
		public function RegisterBaseUserEvent(baseUserDTO:BaseUserDTO, callBack:Function)
		{
			super(GazuntiteClientController.REGISTER_BASE_USER_EVENT);
			
			this.baseUserDTO = baseUserDTO;
			this.callBack = callBack;
		}
	}
}