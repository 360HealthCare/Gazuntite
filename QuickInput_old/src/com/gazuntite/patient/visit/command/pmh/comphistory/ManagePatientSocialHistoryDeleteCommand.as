package com.gazuntite.patient.visit.command.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.patient.visit.delegate.pmh.comphistory.ManagePatientSocialHistoryDeleteDelegate;
	import com.gazuntite.patient.visit.dto.SocialHistoryDTO;
	import com.gazuntite.patient.visit.event.pmh.comphistory.LoadSocialHistoryByPatientIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.utils.StringUtil;

	public class ManagePatientSocialHistoryDeleteCommand implements Command,IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var delegate:ManagePatientSocialHistoryDeleteDelegate;
		private var responder:Responder;
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			CursorManager.setBusyCursor();
			
			delegate  = new ManagePatientSocialHistoryDeleteDelegate( this );			
			
			var dto:SocialHistoryDTO = model.socialHistoryDTO;
			dto.Social = StringUtil.trim(dto.Social);
			
			delegate.ManagePatientSocialHistoryDelete(dto.patientSocialHistoryAddictionID, dto.Social, dto.PatientSocialHistoryID, model.LoggedInUserId);
		}
		
		public function result(rpcEvent:Object):void
		{
			CursorManager.removeBusyCursor();
			
			/*var xmlStr:String 			= rpcEvent.result.@Status;
			var xmlMessage:String 		= rpcEvent.result.@Message;
			var xmlResponseData:String 	= rpcEvent.result.@ResponseData;
			
			if(xmlResponseData.length)
				model.socialHistoryDTO.ID = int(xmlResponseData);
			
			if(xmlStr.toLowerCase() == "true")
			{*/
				//send load call
				var loadSocialHistoryEvent:LoadSocialHistoryByPatientIdEvent = new LoadSocialHistoryByPatientIdEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(loadSocialHistoryEvent);
			//}
			//else
				//Alert.show("Your Record is not deleted", "ManagePatientSocialHistoryDeleteCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
		
		public function  fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in ManagePatientSocialHistoryDeleteCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1 : model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}