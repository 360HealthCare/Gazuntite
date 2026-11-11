package com.gazuntite.input.event.visit.physical.cchpi 
{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadAllHPIDetailTypesEvent extends CairngormEvent 
	{
		public function LoadAllHPIDetailTypesEvent( ) 
		{
			super( QIController.LOAD_ALL_HPI_DETAIL_TYPES_EVENT);
			
		}
	}
}