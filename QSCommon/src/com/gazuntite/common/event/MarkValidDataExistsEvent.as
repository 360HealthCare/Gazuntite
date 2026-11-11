package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.util.QSConstants;

	public class MarkValidDataExistsEvent extends CairngormEvent
	{
		public var clearQuickInput:Boolean;
		public var functionName : Function;
		
		public var visitID:int
		public var visitDate:String
		
		public var LoggedInUserId:int;
		public var placeOfServiceID:int;
		public var EncounterTypeId:int;

		public var LoggedInUserSessionID:String;
		
		public function MarkValidDataExistsEvent(LoggedInUserId:int , placeOfServiceID:int ,EncounterTypeId:int, LoggedInUserSessionID:String, visitID:int ,visitDate:String)
		{
			super(QSCommonController.MARK_VALID_DATA_EXISTS_EVENT);
			this.clearQuickInput = clearQuickInput;
			this.functionName = functionName;
			
			this.visitID						= visitID;
			this.visitDate						= visitDate;
			this.LoggedInUserId					= LoggedInUserId;
			this.placeOfServiceID				= placeOfServiceID;
			this.EncounterTypeId				= EncounterTypeId;
			this.LoggedInUserSessionID			= LoggedInUserSessionID;
		}
	}
}