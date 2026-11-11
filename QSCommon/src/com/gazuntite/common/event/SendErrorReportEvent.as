package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.dto.ErrorReportDTO;

	public class SendErrorReportEvent extends CairngormEvent
	{
		public var objErrorReportDTO:ErrorReportDTO;
		public var callBack :Function;
		
		
		public function SendErrorReportEvent(objErrorReportDTO:ErrorReportDTO,callback:Function)
		{
			super(QSCommonController.SEND_ERROR_REPORT_EVENT);
			this.objErrorReportDTO = objErrorReportDTO;
			this.callBack = callback;
		}
	}
}