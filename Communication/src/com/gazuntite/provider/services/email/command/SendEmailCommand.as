/*
*Class: SendEmailCommand
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.services.email.delegate.SendMailDelegate;
	import com.gazuntite.provider.services.email.event.SendEmailEvent;
	import com.gazuntite.provider.services.email.model.EmailModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class SendEmailCommand implements Command 
	{
		private var model : EmailModelLocator = EmailModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : SendMailDelegate;
		
		public function SendEmailCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new SendMailDelegate(responder);
			
			//var EV:GetEmailEvent = cgEvent as GetEmailEvent;
			//delegate.GetEmailList(EV.clinicBranchid,EV.userId,EV.stationId);
			
			var SE:SendEmailEvent = cgEvent as SendEmailEvent;
			delegate.SendEmail(SE.objEmailDTO);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			trace(event.result);
			var result:String = event.result.toString();
			
			//Alert.show("Email sent successfully.","Email Sent",4,FlexGlobals.topLevelApplication.mainContainer);
			UtilityFunctions.ShowMessage("Email sent successfully.","Email Sent");

		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in SendEmailCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.fault.faultString, userId);

			//Alert.show("Error in Sending Mail.");
		}
	}
}