package com.gazuntite.provider.services.sms.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSExceptionAlert;
	import com.gazuntite.provider.services.sms.delegate.SendSMSDelegate;
	import com.gazuntite.provider.services.sms.event.SendSMSEvent;
	import com.gazuntite.provider.services.sms.model.SMSModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class SendSMSCommand implements Command
	{
		
		private var model : SMSModelLocator = SMSModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : SendSMSDelegate;
		
	
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new SendSMSDelegate(responder);
			
			//var EV:GetEmailEvent = cgEvent as GetEmailEvent;
			//delegate.GetEmailList(EV.clinicBranchid,EV.userId,EV.stationId);
			
			var SE:SendSMSEvent = cgEvent as SendSMSEvent;
			delegate.SendSMS(SE.objSMSDTO);
		}
		private function onSuccess(event:ResultEvent):void
		{
			trace(event.result);
			var result:String = event.result.toString();
			
			Alert.show("SMS sent successfully.","Sms Sent",4,FlexGlobals.topLevelApplication.mainContainer);
		}
		
		private function onError(event:FaultEvent):void
		{
			var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error in Sending SMS ",event.fault.faultString,model.loggedInUserId);
			PopUpManager.centerPopUp(cAlert); 
			
			//Alert.show("Error in Sending SMS.");
		}
	}
}