package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.visit.VisitDTO;
	import com.gazuntite.input.controller.QIController;
	
	public class CreateVisitEvent extends CairngormEvent
	{
		public var visitDTO:VisitDTO;
		public var func:Function;
		
		public function CreateVisitEvent(visitDTO:VisitDTO, _func:Function)
		{
			super(QIController.CREATE_NEW_VISIT);
			this.visitDTO 	= visitDTO;
			this.func 		= _func;
		}
	}
}