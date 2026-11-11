package com.gazuntite.input.event.visit.physical.physical
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class LoadPhysicalCategoryTypesEvent extends CairngormEvent
	{
		import com.adobe.cairngorm.control.CairngormEvent;
		import com.gazuntite.input.controller.QIController;
		
		public var IsMale:Boolean; 
		public function LoadPhysicalCategoryTypesEvent(isMale:Boolean)
		{
			super( QIController.LOAD_PHYSICAL_CATEGORY_TYPES_EVENT);
			
			this.IsMale = isMale;
		}
	}
}