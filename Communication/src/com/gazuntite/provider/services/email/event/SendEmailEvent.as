/*
*Class: SendEmailEvent
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.email.appController.EmailController;
	import com.gazuntite.provider.services.email.dto.EmailDTO;

	public class SendEmailEvent  extends CairngormEvent
	{
		public var objEmailDTO:EmailDTO;
		
		public function SendEmailEvent(objEmailDTO:EmailDTO)
		{
			super(EmailController.SEND_EMAIL_EVENT);
			
			this.objEmailDTO = objEmailDTO;
		}
	}
}