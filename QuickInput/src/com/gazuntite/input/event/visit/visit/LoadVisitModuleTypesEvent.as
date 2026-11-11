package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadVisitModuleTypesEvent extends CairngormEvent
	{
		public function LoadVisitModuleTypesEvent()
		{
			super(QIController.Load_VISIT_MODULE_TYPE_Event);
		}
	}
}