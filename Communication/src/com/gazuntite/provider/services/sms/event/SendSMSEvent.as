package com.gazuntite.provider.services.sms.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.sms.appController.SMSController;
	import com.gazuntite.provider.services.sms.dto.SMSDTO;
	import com.gazuntite.provider.services.sms.dto.SMSRecieverListDTO;

	public class SendSMSEvent extends CairngormEvent
	{
		public var objSMSDTO:SMSDTO;
		
		public function SendSMSEvent(objSMSDTO:SMSDTO)
		{
			super(SMSController.SEND_SMS_EVENT);
			this.objSMSDTO = objSMSDTO;
			
		}
	}
}