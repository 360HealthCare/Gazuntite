package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;

	public class GenderTypeDTO
	{
		public function GenderTypeDTO()
		{
		}
		
		private var _GenderCode : String;
		private var _GenderId : int;
		private var _GenderName : String;

		public function FromXML(x:XML):void
		{
			GenderCode 				= x.@["Code"];
			GenderId 				= x.@["ID"];
			GenderName 				= x.@["Name"];			
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("Gender");
			
			x.@["Code"] 		= GenderCode;
			x.@["ID"] 			= GenderId;
			x.@["Name"] 	    = GenderName;			
						
			return x;
		}
		
		public function get GenderCode():String
		{
			return _GenderCode;
		}

		public function set GenderCode(value:String):void
		{
			_GenderCode = value;
		}

		public function get GenderId():int
		{
			return _GenderId;
		}

		public function set GenderId(value:int):void
		{
			_GenderId = value;
		}

		public function get GenderName():String
		{
			return _GenderName;
		}

		public function set GenderName(value:String):void
		{
			_GenderName = value;
		}
	}
}