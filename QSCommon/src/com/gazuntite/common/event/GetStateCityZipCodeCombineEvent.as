package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class GetStateCityZipCodeCombineEvent extends CairngormEvent
	{
		public var state:String;
		public var city:String;
		public var zip:String;
		public var func:Function;
		
		public function GetStateCityZipCodeCombineEvent(_state:String, _city:String, _zip:String, _func:Function)
		{
			super(QSCommonController.GET_STATE_CITY_ZIP_CODE_COMBINE_EVENT);
			this.state = _state;
			this.city = _city;
			this.zip = _zip;
			this.func = _func;
		}
	}
}