package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;

	public class LoadPlaceOfServiceTypesEvent extends CairngormEvent
	{
		public var typeName		:String	;
		public var callBack		:Function;
		
		public function LoadPlaceOfServiceTypesEvent(typeName:String, callBack:Function)
		{
			super( QSCommonController.LOAD_PLACE_OF_SERVICE_TYPES_EVENT);
			this.typeName = typeName;
			this.callBack = callBack;
		}
	}
}