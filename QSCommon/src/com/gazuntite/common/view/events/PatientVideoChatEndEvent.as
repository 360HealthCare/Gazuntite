package com.gazuntite.common.view.events
{
	import com.gazuntite.common.dto.VitalsDTO;
	
	import flash.events.Event;

	public class PatientVideoChatEndEvent extends Event
	{
		public static const PATIENT_CHAT_END	:String = "PatientChatEnd";
		
		public var vitals:VitalsDTO;
		
		public function PatientVideoChatEndEvent(dto:VitalsDTO)
		{
			super( PATIENT_CHAT_END, true, false );
			vitals = dto;
		}
	}
}