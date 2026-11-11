package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;

	[Bindable]
	public class SocialHistoryUsageAmountTypeDTO extends GeneralTypeDTO
	{
		private var _AddictionID:int;
		private var _AddictionName:String;
		private var _Present:Boolean;
		private var _Past:Boolean;
		
		public function SocialHistoryUsageAmountTypeDTO()
		{
			super();
		}
		
		public function get Past():Boolean
		{
			return _Past;
		}

		public function set Past(value:Boolean):void
		{
			_Past = value;
		}

		public function get Present():Boolean
		{
			return _Present;
		}

		public function set Present(value:Boolean):void
		{
			_Present = value;
		}

		public function get AddictionName():String
		{
			return _AddictionName;
		}

		public function set AddictionName(value:String):void
		{
			_AddictionName = value;
		}

		public function get AddictionID():int
		{
			return _AddictionID;
		}

		public function set AddictionID(value:int):void
		{
			_AddictionID = value;
		}

		public override function FromXML(x:XML):void
		{
			super.FromXML( x );
			this.AddictionID 	= x.@AddictionID;
			this.AddictionName 	= x.@AddictionName;
			this.Present 		= x.@Present;
			this.Past 			= x.@Past;
		}
		
	}
}