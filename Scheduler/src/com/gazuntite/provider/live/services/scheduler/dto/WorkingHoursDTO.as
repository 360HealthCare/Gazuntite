package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;

	[Bindable]
	public class WorkingHoursDTO
	{
	//	<WorkingHour StartTime="09:00 AM" EndTime="09:15 AM"/>
		private var m_sStartTime:String;
		private var m_sEndTime:String;
		
		// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			StartTime 	= x.@[SchedulerXmlConstants.STARTTIME];
			EndTime	 	= x.@[SchedulerXmlConstants.ENDTIME];
			
		}
	
		//##################### GETTER & SETTER ########################################		
		public function get StartTime():String
		{
			return m_sStartTime;
		}
		
		public function set StartTime(value:String):void
		{
			m_sStartTime = value;
		}
		
		public function get EndTime():String
		{
			return m_sEndTime;
		}
		
		public function set EndTime(value:String):void
		{
			m_sEndTime = value;
		}
	}
}