package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadLIONICLabTestTypeEvent extends CairngormEvent
	{
		public var labTestCodeOrName:String;
		public var labtestTypeID:int;
		
		public var searchType:int;
		public var callback:Function;
		
		public function LoadLIONICLabTestTypeEvent(labTestCodeOrName:String, labtestTypeID:int, searchType:int)
		{
			
			this.labTestCodeOrName = labTestCodeOrName;
			this.labtestTypeID = labtestTypeID;
			this.searchType = searchType;
			
			super (QIController.LOAD_LIONIC_LAB_TEST_TYPE_EVENT);
		}
	}
}