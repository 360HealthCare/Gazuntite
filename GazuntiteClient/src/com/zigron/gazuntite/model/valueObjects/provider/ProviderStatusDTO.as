package com.zigron.gazuntite.model.valueObjects.provider
{
	[Bindable]
	public class ProviderStatusDTO
	{
		public static const ONLINE:String	= "available";
		public static const AWAY:String		= "away";
		public static const BUSY:String		= "busy";
		
		
		private var _status:String;
		
		public function ProviderStatusDTO()
		{
			_status = ONLINE;
		}

		public function get status():String
		{
			return _status;
		}

		public function set status(value:String):void
		{
			value = value.toLowerCase();
			
			if( value != ONLINE && value != AWAY && value != BUSY )
				throw("invalid status value '" + value + "'");
			
			_status = value;
		}

	}
}