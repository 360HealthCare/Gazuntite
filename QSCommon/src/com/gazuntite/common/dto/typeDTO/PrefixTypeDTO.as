package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;

	public class PrefixTypeDTO
	{
		public function PrefixTypeDTO()
		{
		}
		
		private var _PrefixCode : String;
		private var _PrefixId : int;
		private var _PrefixName : String;

		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("PrefixTypeDTO");
			
			x.@["Code"] 		= PrefixCode;
			x.@["ID"] 		= PrefixId;
			x.@["Name"] 		= PrefixName;			
						
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			PrefixCode 				= x.@["Code"];
			PrefixId 				= x.@["ID"];
			PrefixName 				= x.@["Name"];			
		}
		
		public function get PrefixCode():String
		{
			return _PrefixCode;
		}

		public function set PrefixCode(value:String):void
		{
			_PrefixCode = value;
		}

		public function get PrefixId():int
		{
			return _PrefixId;
		}

		public function set PrefixId(value:int):void
		{
			_PrefixId = value;
		}

		public function get PrefixName():String
		{
			return _PrefixName;
		}

		public function set PrefixName(value:String):void
		{
			_PrefixName = value;
		}


	}
}