package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	
	[Bindable]
	public class EncounterTypeDTO
	{
		private var m_sEncounterTypeID:String;		
		private var m_sEncounterTypeName:String;
		
		public function FromXML( x:XML ):void
		{
			EncounterTypeID 								= x.@[XmlConstants.ENCOUNTERTYPEID];			
			EncounterTypeName 						= x.@[XmlConstants.ENCOUNTERTYPENAME];			
		}
		
		public function get EncounterTypeID():String
		{
			return m_sEncounterTypeID;
		}
		
		public function set EncounterTypeID(value:String):void
		{
			m_sEncounterTypeID = value;
		}
		
		public function get EncounterTypeName():String
		{
			return m_sEncounterTypeName;
		}
		
		public function set EncounterTypeName(value:String):void
		{
			m_sEncounterTypeName = value;
		}
		
		public function EncounterTypeDTO()
		{
		}	
	}
}