package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	import com.gazuntite.patient.visit.dto.visit.VisitDTO;
	
	public class CreateVisitEvent extends CairngormEvent
	{
		public var visitDTO:VisitDTO;
		
		public function CreateVisitEvent(visitDTO:VisitDTO)
		{
			super(QIController.CREATE_NEW_VISIT);
			this.visitDTO = visitDTO;
		}
	}
}