package com.gazuntite.common.dto.baseDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class GeneralTypeDTO extends GeneralLabelDTO
	{
		private var _ID:int;
		private var _Name:String = '';
		
		public function GeneralTypeDTO()
		{
			
		}
		
		public function get Name():String
		{
			return _Name;
		}
		
		public function get NodeName():String
		{
			return nodeName;
		}
		
		public function set NodeName(value:String):void
		{
			nodeName = value;
		}
			
		public function set Name(value:String):void
		{
			_Name = value;
		}

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		public override function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			x.@ID = this.ID;
			x.@Name = this.Name;
			
			return x;
		}
		
		public override function FromXML(x:XML):void
		{
			this.ID = x.@ID;
			this.Name = x.@Name;
			this.label = this.Name;
		}
	}
}