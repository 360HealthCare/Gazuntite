package com.gazuntite.provider.services.sms.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSExceptionAlert;
	import com.gazuntite.provider.services.sms.delegate.GetSentSMSListDelegate;
	import com.gazuntite.provider.services.sms.dto.SMSResultList;
	import com.gazuntite.provider.services.sms.event.GetSentSMSEvent;
	import com.gazuntite.provider.services.sms.model.SMSModelLocator;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class GetSMSListCommand implements Command
	{
		private var model : SMSModelLocator = SMSModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : GetSentSMSListDelegate;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new GetSentSMSListDelegate(responder);
			
			var GSSV:GetSentSMSEvent  = cgEvent as GetSentSMSEvent;
			callBack = GSSV.callBack;
			delegate.GetSMSList(GSSV.clinicBranchID,GSSV.userID,model.totalPage,model.currentPage);
		}
		
		
		private function onSuccess(event:ResultEvent):void
		{
			
			trace(event.result);
			/*
			var esl:EmailResultList = new EmailResultList();
			esl.FromXMLSentEmail(event.result as XML);
			model.m_oEmailResultList =esl;
			
			
			var esl:EmailResultList = new EmailResultList();
			esl.FromXML(event.result as XML);
			model.m_oEmailResultList =esl;
			
			model.currentPage = EmailConstant.CURRENTPAGE;
			model.totalPage  = EmailConstant.TOTALEMAILS;
			*/
			var xx:XML = event.result as XML;
			//var xx:XMLList= xml.SMSLog;
			
			model.totalPage= xx.@["TotalPages"];
				
			
			var smsRL:SMSResultList=new SMSResultList();
			smsRL.FromXML(event.result as XML);
		   model.smsResultList = smsRL;
		   
		   if(null != callBack)
			   callBack();
			
		}
		
		
		
		private function onError(event:FaultEvent):void
		{
			var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error in Getting SMS List ",event.fault.faultString,model.loggedInUserId);
			PopUpManager.centerPopUp(cAlert); 
			/// Need to change information later on
			///Alert.show("Received In GetEmailListCommand.\n" + event.toString(), sms .ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}