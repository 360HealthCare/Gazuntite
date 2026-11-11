package com.gazuntite.input.event.visit.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class MarkValidDataExistsEvent extends CairngormEvent
	{
		public var clearQuickInput:Boolean;
		public var functionName : Function;
		
		public var visitID:int
		public var visitDate:String
		
		public function MarkValidDataExistsEvent()
		{
			super(QIController.MARK_VALID_DATA_EXISTS_EVENT);
			this.clearQuickInput = clearQuickInput;
			this.functionName = functionName;
		}
	}
}