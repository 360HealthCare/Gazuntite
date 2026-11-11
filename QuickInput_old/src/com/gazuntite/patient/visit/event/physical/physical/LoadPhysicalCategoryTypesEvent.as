package com.gazuntite.patient.visit.event.physical.physical
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class LoadPhysicalCategoryTypesEvent extends CairngormEvent
	{
		import com.adobe.cairngorm.control.CairngormEvent;
		import com.gazuntite.patient.visit.controller.QIController;
		
		public var IsMale:Boolean; 
		public function LoadPhysicalCategoryTypesEvent(isMale:Boolean)
		{
			super( QIController.LOAD_PHYSICAL_CATEGORY_TYPES_EVENT);
			
			this.IsMale = isMale;
		}
	}
}