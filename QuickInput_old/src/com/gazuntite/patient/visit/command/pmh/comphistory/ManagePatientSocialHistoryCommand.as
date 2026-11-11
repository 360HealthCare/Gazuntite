package com.gazuntite.patient.visit.command.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.pmh.comphistory.ManagePatientSocialHistoryDelegate;
	import com.gazuntite.patient.visit.event.pmh.comphistory.ManagePatientSocialHistoryEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	
	public class ManagePatientSocialHistoryCommand  implements Command,IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var delegate:ManagePatientSocialHistoryDelegate
		private var callBack:Function;
		private var responder:Responder;
		
		private var LE:ManagePatientSocialHistoryEvent;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			CursorManager.setBusyCursor();
			
			delegate  = new ManagePatientSocialHistoryDelegate( this );			
			
			LE = cgEvent as ManagePatientSocialHistoryEvent;
			
			callBack = LE.callBack;
			
			delegate.ManagePatientSocialHistory(model.socialHistoryDTO, model.LoggedInUserSelectedBranchId, model.patientID, model.LoggedInUserSessionID);	
		}
		
		public function result(rpcEvent:Object):void
		{
			CursorManager.removeBusyCursor();
			
			var xmlStr:String 			= rpcEvent.result.@Status;
			var xmlMessage:String 		= rpcEvent.result.@Message;
			var xmlResponseData:String 	= rpcEvent.result.@ResponseData;
			
			if(xmlResponseData.length)
				model.socialHistoryDTO.ID = int(xmlResponseData);
			
			if(xmlStr.toLowerCase() == "true")
				callBack();
			else
				Alert.show(xmlMessage, "ManagePatientSocialHistoryCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
		
		public function  fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in SaveSocialHistoryCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);	
		}
	}
}