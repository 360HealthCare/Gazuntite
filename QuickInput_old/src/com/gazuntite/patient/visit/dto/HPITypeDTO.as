package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class HPITypeDTO
	{
		
		private var m_sID:int;

		public function get ID():int
		{
			return m_sID;
		}

		public function set ID(value:int):void
		{
			m_sID = value;
		}

		private var m_sName:String;

		public function get Name():String
		{
			return m_sName;
		}

		public function set Name(value:String):void
		{
			m_sName = value;
		}

		
		public function HPITypeDTO()
		{
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("HPITypeDTO");
			
			x.@ID 	= this.ID;
			x.@Name = this.Name;
			
			return x;
		}
		
		
		public function FromXML(x:XML):void
		{
			this.ID 	= x.@ID;
			this.Name 	= x.@Name;
		}
		
	}
}