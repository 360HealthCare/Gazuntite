package com.gazuntite.input.command.visit.pmh.comphistory
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.delegate.visit.pmh.comphistory.SaveMedicalHistoryDelegate;
	import com.gazuntite.input.event.visit.pmh.comphistory.SaveMedicalHistoryEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class SaveMedicalHistoryCommand implements Command,IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var delegate:SaveMedicalHistoryDelegate;
		private var callBack:Function;
		private var responder:Responder;
		private static const GENERAL:int = 0;
		private static const FAMILY:int = 1;
		private static const SOCIAL:int = 2;
		
		private static var module:int = GENERAL;
		private var LE:SaveMedicalHistoryEvent
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			CursorManager.setBusyCursor();
			
			delegate  = new SaveMedicalHistoryDelegate( this );			
			
			LE = cgEvent as SaveMedicalHistoryEvent;
			
			callBack = LE.callBack;
			
			delegate.SaveMedicalHistoryList(LE.medicalHistory, model.LoggedInUserSelectedBranchId, model.patientDTO.ID,model.LoggedInUserSessionID);	
		}
		
		public function result(rpcEvent:Object):void
		{
			CursorManager.removeBusyCursor();
			
			var xmlStr:String = rpcEvent.result.toString();
			trace(xmlStr);
			
			callBack();
		}
		
		public function  fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in SaveMedicalHistoryCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}