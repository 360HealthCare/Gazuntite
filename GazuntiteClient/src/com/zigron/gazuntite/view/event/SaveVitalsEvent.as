package com.zigron.gazuntite.view.event
{
	import com.gazuntite.common.dto.VitalsDTO;
	
	import flash.events.Event;
	
	public class SaveVitalsEvent extends Event
	{
		public static const SAVE_VITAL_EVENT:String = "SaveVitalEvent";
		
		public var vitalsDTO:VitalsDTO;
		
		public function SaveVitalsEvent(dto:VitalsDTO)
		{
			super(SAVE_VITAL_EVENT, bubbles, cancelable);
			vitalsDTO = dto;
		}
	}
}