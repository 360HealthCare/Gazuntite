package com.gazuntite.provider.live.services.scheduler.dto.staticData
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;

	public class StationsDTO
	{
		private var m_sID:String;
		private var m_sName:String;
		private var m_sClinicID:String;
		
		// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			ID 					= x.@[SchedulerXmlConstants.ID];
			Name 				= x.@[SchedulerXmlConstants.NAME];
			ClinicID   	        = x.@[SchedulerXmlConstants.CLIENID];
		}
	
	// GETTER & SETTER
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

		public function get ClinicID():String
		{
			return m_sClinicID;
		}

		public function set ClinicID(value:String):void
		{
			m_sClinicID = value;
		}

	}
}