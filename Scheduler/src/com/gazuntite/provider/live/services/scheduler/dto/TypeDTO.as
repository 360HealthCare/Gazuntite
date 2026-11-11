package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;

	[Bindable]
	public class TypeDTO
	{
		private var m_sID:String;
		private var m_sName:String;
		
	// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			ID 		= x.@[SchedulerXmlConstants.ID];
			Name 	= x.@[SchedulerXmlConstants.NAME];
			
		}
		
		public function ToXML(data:Object):XML
		{
			var xml:XML = SchedulerXmlUtils.getNodeByTagName( "Type" );
			xml.@[SchedulerXmlConstants.ID]						= data.Type.ID;
			xml.@[SchedulerXmlConstants.NAME]					= data.Type.Name;
			return xml;
		}
		//getter and setter	

		public function get ID():String
		{
			return m_sID;
		}

		public function set ID(value:String):void
		{
			m_sID = value;
		}

		public function get Name():String
		{
			return m_sName;
		}

		public function set Name(value:String):void
		{
			m_sName = value;
		}

	}
}