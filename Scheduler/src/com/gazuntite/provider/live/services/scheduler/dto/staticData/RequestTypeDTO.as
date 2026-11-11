package com.gazuntite.provider.live.services.scheduler.dto.staticData
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;

	[Bindable]
	public class RequestTypeDTO
	{
		private var m_sID:String;
		private var m_sName:String;

		
	// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			ID 	= x.@[SchedulerXmlConstants.ID];
			Name 	= x.@[SchedulerXmlConstants.NAME];
			
		}
	
		
	//Getter & Setter
		
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