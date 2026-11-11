package com.gazuntite.provider.services.sms.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSExceptionAlert;
	import com.gazuntite.provider.services.sms.delegate.*;
	import com.gazuntite.provider.services.sms.event.*;
	import com.gazuntite.provider.services.sms.model.SMSModelLocator;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class DeleteSMSCommand implements Command
	{
		
		private var model : SMSModelLocator = SMSModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : DeleteSMSDelegate;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new DeleteSMSDelegate(responder);
			
			var DSV:DeleteSMSEvent = cgEvent as DeleteSMSEvent;
			
			callBack = DSV.callBack;
			delegate.DeleteSMS(DSV.smsIDs,DSV.userID);
		}
		
		
		private function onSuccess(event:ResultEvent):void
		{
			trace(event.result);
			if(null != callBack)
				callBack();
		}
		
		
		
		private function onError(event:FaultEvent):void
		{
			var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error in Deleting SMS ",event.fault.faultString,model.loggedInUserId);
			PopUpManager.centerPopUp(cAlert); 
			//Alert.show("Received In GetEmailListCommand.\n" + event.toString(), 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}