package com.gazuntite.input.command.visit.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.delegate.visit.pmh.comphistory.ManagePatientSocialHistoryDelegate;
	import com.gazuntite.input.event.visit.pmh.comphistory.ManagePatientSocialHistoryEvent;
	import com.gazuntite.input.model.QIModelLocator;
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
			
			//delegate.ManagePatientSocialHistory(model.socialHistoryDTO, model.LoggedInUserSelectedBranchId, model.patientDTO.ID, model.LoggedInUserSessionID);	
			delegate.ManagePatientSocialHistory(model.patientSocialHistoryManageDTO, model.LoggedInUserSelectedBranchId, model.patientDTO.ID, model.LoggedInUserSessionID);	
		}
		
		public function result(rpcEvent:Object):void
		{
			CursorManager.removeBusyCursor();
			
			if(rpcEvent.result.toString().toLowerCase() == 'true')
				callBack();
			else
				Alert.show("Save faild", 'ManagePatientSocialHistoryCommand', 4, FlexGlobals.topLevelApplication.mainContainer);
			
			//callBack();
		}
		
		public function  fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in SavefamilyHistoryCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}