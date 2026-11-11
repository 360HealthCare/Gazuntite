package com.gazuntite.provider.services.sms.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.services.sms.command.DeleteSMSCommand;
	import com.gazuntite.provider.services.sms.command.GetSMSListCommand;
	import com.gazuntite.provider.services.sms.command.SendSMSCommand;
	
	public class SMSController extends FrontController
	{
		public static const SEND_SMS_EVENT: String = "SendSMS";
		public static const GET_SENT_SMS_EVENT: String = "GetSentSMSList";
		public static const DELETE_SENT_SMS_EVENT: String = "DeleteSMS";
		
		
		private static var m_oSMSController:SMSController ;
		
		public static function getInstance():SMSController 
		{
			if ( m_oSMSController == null )
				m_oSMSController = new SMSController(new Lock());
			return m_oSMSController;
		}
		
		public function SMSController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
				
			addCommand(GET_SENT_SMS_EVENT,GetSMSListCommand);
			addCommand(SEND_SMS_EVENT,SendSMSCommand);
			addCommand(DELETE_SENT_SMS_EVENT,DeleteSMSCommand);
		}
	}
}

class Lock
{
	//Singlton Lock
}