/*
*Class: EmailController
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.services.email.command.DeleteEmailCommand;
	import com.gazuntite.provider.services.email.command.GetEmailListCommand;
	import com.gazuntite.provider.services.email.command.GetSentEmailListCommand;
	import com.gazuntite.provider.services.email.command.SendEmailCommand;
	import com.gazuntite.provider.services.email.command.ViewEmailCommand;

	public class EmailController extends FrontController
	{
		public static const GET_EMAIL_LIST_EVENT: String = "GetEmialList";
		public static const GET_SENT_EMAIL_EVENT: String = "SentEmail";
		public static const SEND_EMAIL_EVENT: String ="SendEmail";
		public static const GET_EMAIL_DETAILS_EVENT: String = "GetEmail";
		public static const DELETE_EMAIL_EVENT: String = "DeleteEmail";
		
		
		private static var m_oEmailController:EmailController ;
		
		public static function getInstance():EmailController 
		{
			if ( m_oEmailController == null )
				m_oEmailController = new EmailController(new Lock());
			return m_oEmailController;
		}
		
		public function EmailController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
				
			addCommand(GET_EMAIL_LIST_EVENT,GetEmailListCommand);
			addCommand(GET_SENT_EMAIL_EVENT,GetSentEmailListCommand);
			addCommand(SEND_EMAIL_EVENT,SendEmailCommand);
			addCommand(GET_EMAIL_DETAILS_EVENT,ViewEmailCommand);
			
			addCommand(DELETE_EMAIL_EVENT,DeleteEmailCommand);
			
		}
	}
}

class Lock
{
	//Singlton Lock
}