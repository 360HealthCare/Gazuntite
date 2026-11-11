package com.gazuntite.history.view.event
{
	import com.gazuntite.history.dto.PatientVisitProviderDTO;
	
	import flash.events.Event;
	
	public class ProviderSelectionEvent extends Event
	{
		public static const ProviderSelection:String = 'PROVIDER_SELECTION_EVENT';
	
		public var SelectedProvider:PatientVisitProviderDTO;
		
		public function ProviderSelectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}