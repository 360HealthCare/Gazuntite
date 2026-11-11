package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class QSAllergyEvent extends CairngormEvent
	{
		public var parameterType			: int;
		public var allergyParameter			: *;
		public var callBack				: Function;
		
		public function QSAllergyEvent(parameterType:int, allergyParameter:*, callBack:Function = null)
		{
			super(QSCommonController.QS_ALLERGY_EVENT);
			
			this.parameterType		= parameterType;
			this.allergyParameter 	= allergyParameter;
			this.callBack			= callBack;
		}
	}
}