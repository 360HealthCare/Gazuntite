package com.gazuntite.provider.services.email.command
{
	/*
	*Class: ViewEmailCommand
	*Created by: Zahid Mehmood
	*Description: This class contains Command for Email Inbox 
	*Copyright 2011 Zigron Inc. All right reserved
	*/
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.services.email.delegate.ViewMailDelegate;
	import com.gazuntite.provider.services.email.dto.EmailDTO;
	import com.gazuntite.provider.services.email.dto.EmailResultList;
	import com.gazuntite.provider.services.email.event.ViewEmailEvent;
	import com.gazuntite.provider.services.email.model.EmailModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ViewEmailCommand implements Command 
	{
		private var model : EmailModelLocator = EmailModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : ViewMailDelegate;
		
		
		
		private var callBack			: Function;
		
		public function ViewEmailCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new  ViewMailDelegate(responder);
			
			var VEV:ViewEmailEvent = cgEvent as ViewEmailEvent;
			
			callBack = VEV.callBack;
			
			delegate.GetEmail(VEV.emailID,VEV.userId,VEV.clinicBranchid,VEV.stationId,VEV.isInbox);
			
		}
		
		
		private function onSuccess(event:ResultEvent):void
		{
			
			trace(event.result);
			
			var esl:EmailResultList = new EmailResultList();
		    var emailDTO:EmailDTO= 
			esl.FromXMLToSingleMail(event.result as XML);
			
			model.message = emailDTO.Message;
			model.subject = emailDTO.Subject;
			model.from = emailDTO.From;
			model.sendto = emailDTO.sendto;
			model.senderID = emailDTO.SENDERID;
			if(emailDTO.HasAttachment == "true")
			model.hasAttachment = true;//emailDTO.HasAttachment;
			else
				model.hasAttachment = false;
			model.mailSentAt = emailDTO.MailSentAt;
			model.fileName =  emailDTO.AttachedFileName;
			model.emailID = emailDTO.EmailID;
			
			if(null != callBack)
				callBack();
		}
		
		
		
		private function onError(event:FaultEvent):void
		{
			
			var errorStatus:String = "Fault occured in ViewEmailCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.fault.faultString, userId);

			//Alert.show("Received In Get Email.\n" + event.toString(), EmailConstant.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}