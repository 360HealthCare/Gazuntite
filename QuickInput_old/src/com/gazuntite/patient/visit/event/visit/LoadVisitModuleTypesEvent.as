package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadVisitModuleTypesEvent extends CairngormEvent
	{
		public function LoadVisitModuleTypesEvent()
		{
			super(QIController.Load_VISIT_MODULE_TYPE_Event);
		}
	}
}