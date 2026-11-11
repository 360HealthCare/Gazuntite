package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class MarkValidDataExistsEvent extends CairngormEvent
	{
		public var clearQuickInput:Boolean;
		public var functionName : Function;
		
		public function MarkValidDataExistsEvent(functionName:Function = null)
		{
			super(QIController.MARK_VALID_DATA_EXISTS_EVENT);
			this.clearQuickInput = clearQuickInput;
			this.functionName 	 = functionName;
		}
	}
}