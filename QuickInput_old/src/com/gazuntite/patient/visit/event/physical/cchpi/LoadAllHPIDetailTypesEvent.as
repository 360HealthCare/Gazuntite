package com.gazuntite.patient.visit.event.physical.cchpi 
{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadAllHPIDetailTypesEvent extends CairngormEvent 
	{
		public function LoadAllHPIDetailTypesEvent( ) 
		{
			super( QIController.LOAD_ALL_HPI_DETAIL_TYPES_EVENT);
			
		}
	}
}