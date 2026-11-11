package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadAllBloodRelationShipTypeDTOEvent extends CairngormEvent
	{
		
		public function LoadAllBloodRelationShipTypeDTOEvent()
		{
			super(QIController.LOAD_ALL_BLOOD_RELATIONSHIP_TYPE_DTO_EVENT);
		}
	}
}