package com.zigron.gazuntite.model.valueObjects.login
{
	import com.gazuntite.provider.services.email.util.XMLUtil;

	public class SessionTypeDTO
	{
		
		private var _userSessionStatusID:int;
		private var _Description:String;
		
		public function SessionTypeDTO()
		{
			
		}

		public function FromXml(x:XML):void
		{
			userSessionStatusID = x.@userSessionStatusID;
			Description 		= x.@Description;

		}
		
		public function ToXml():XML
		{
			var x:XML = XMLUtil.getNodeByTagName('userSessionTypeDTO');
			x.@userSessionStatusID	= userSessionStatusID;
			x.@Description			= Description;
			
			return x;
		}
		
		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}

		public function get userSessionStatusID():int
		{
			return _userSessionStatusID;
		}

		public function set userSessionStatusID(value:int):void
		{
			_userSessionStatusID = value;
		}

	}
}