package com.gazuntite.common.event.provider
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class GetSpecialityEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var isNewCallInService:Boolean;
		
		public function GetSpecialityEvent(resultHandlerFunction:Function,isNewCallInService:Boolean = false)
		{
			super(QSCommonController.GET_SPECIALITY);
			
			this.resultHandlerFunction = resultHandlerFunction;	
			this.isNewCallInService = isNewCallInService;
		}
	}
}