package com.gazuntite.input.view.event
{
	import com.gazuntite.common.dto.pmh.immunization.ImmunizationDTO;
	
	import flash.events.Event;
	
	public class ImmunizationDeleteEvent extends Event
	{
		public static const IMMUNIZATION_DELETE_EVENT:String = "ImmunizationDeleteEvent";
		public var dto:ImmunizationDTO;
		
		public function ImmunizationDeleteEvent(_dto:ImmunizationDTO)
		{
			super(IMMUNIZATION_DELETE_EVENT, true, true);
			this.dto = _dto;
		}
	}
}