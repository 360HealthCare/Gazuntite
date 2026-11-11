package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;

	public class StatusTypeDTO
	{
		public function StatusTypeDTO()
		{
		}
		
		private var _StatusID : int;
		private var _StatusName : String;
		
		public function FromXML(x:XML):void
		{
			StatusID 				= x.@["ID"];
			StatusName 				= x.@["Name"];			
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("AccountStatus");
			
			x.@["ID"] 			= StatusID;
			x.@["Name"] 	    = StatusName;			
			
			return x;
		}

		public function get StatusID():int
		{
			return _StatusID;
		}

		public function set StatusID(value:int):void
		{
			_StatusID = value;
		}

		public function get StatusName():String
		{
			return _StatusName;
		}

		public function set StatusName(value:String):void
		{
			_StatusName = value;
		}


	}
}