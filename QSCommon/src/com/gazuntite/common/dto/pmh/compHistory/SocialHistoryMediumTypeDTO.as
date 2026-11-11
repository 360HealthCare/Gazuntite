package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;

	[Bindable]
	public class SocialHistoryMediumTypeDTO extends GeneralTypeDTO
	{
		private var _Addication:int;
		private var _AddicationName:String;
		
		public function SocialHistoryMediumTypeDTO()
		{
		}

		public function get AddicationName():String
		{
			return _AddicationName;
		}

		public function set AddicationName(value:String):void
		{
			_AddicationName = value;
		}

		public function get Addication():int
		{
			return _Addication;
		}

		public function set Addication(value:int):void
		{
			_Addication = value;
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML( x );
			this.Addication			= x.@Addiction;
			this.AddicationName 	= x.@AddictionName;
			
		}
	}
}