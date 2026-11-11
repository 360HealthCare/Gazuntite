package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class RelationshipTypeDTO
	{
		private var _ID:int;
		private var _Code:String;
		private var _Name:String;
		
		
		
		public function RelationshipTypeDTO()
		{
		}
		
		public  function FromXML(x:XML):void
		{
			
			ID 				= x.@ID;
			Code 			= x.@Code;
			Name 			= x.@Name;
		}
	
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("RelationshipTypeDTO");
			
			x.@ID			=this.ID ;
			x.@Name			=this.Name ;
			x.@Code			=this.Code ;

			return x;
		}

		

		public function get Name():String
		{
			return _Name;
		}

		public function set Name(value:String):void
		{
			_Name = value;
		}

		public function get Code():String
		{
			return _Code;
		}

		public function set Code(value:String):void
		{
			_Code = value;
		}

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

	}
}