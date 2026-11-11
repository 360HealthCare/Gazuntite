package com.gazuntite.patient.visit.event.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadLIONICLabTestTypeEvent extends CairngormEvent
	{
		public var labTestCodeOrName	:String;
		public var labtestTypeID		:int;
		
		public function LoadLIONICLabTestTypeEvent(labTestCodeOrName:String, labtestTypeID:int)
		{
			
			this.labTestCodeOrName 	= labTestCodeOrName;
			this.labtestTypeID 		= labtestTypeID;
			super( QIController.LOAD_LIONIC_LAB_TEST_TYPE_EVENT);
		}
	}
}