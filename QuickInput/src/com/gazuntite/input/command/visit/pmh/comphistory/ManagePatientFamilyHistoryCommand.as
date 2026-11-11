package com.gazuntite.input.command.visit.pmh.comphistory
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.delegate.visit.pmh.comphistory.ManagePatientFamilyHistoryDelegate;
	import com.gazuntite.input.event.visit.pmh.comphistory.ManagePatientFamilyHistoryEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ManagePatientFamilyHistoryCommand implements Command,IResponder
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var delegate:ManagePatientFamilyHistoryDelegate;
		private var callBack:Function;
		private var responder:Responder;
		
		private var LE:ManagePatientFamilyHistoryEvent
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			CursorManager.setBusyCursor();
			
			
			delegate  = new ManagePatientFamilyHistoryDelegate( this );			
			
			LE = cgEvent as ManagePatientFamilyHistoryEvent;
			
			callBack = LE.callBack;
			
			
			if(model.LoggedInUserId )
			{
				delegate.SavefamilyHistoryList(LE.FamilyHistory,model.LoggedInUserSelectedBranchId,model.patientDTO.ID, model.LoggedInUserSessionID);	
			}
			
			
		}
		
		public function result(rpcEvent:Object):void
		{
			
			CursorManager.removeBusyCursor();
			
			var xmlStr:String = rpcEvent.result.toString();
			trace(xmlStr);
			
			callBack();
			
			
			/*var xmlStr:String = rpcEvent.result.toString();
			if( module == GENERAL )//General section saved sucessfully
			{
				module = FAMILY; //next save family history
				
				if( null != model.FamilyHistoryList && model.FamilyHistoryList.length > 0 )
				{
					var fhe:SaveMedicalHistoryEvent = new SaveMedicalHistoryEvent( LE.patientId, LE.branchId, model.FamilyHistoryList, LE.callBack );
					CairngormEventDispatcher.getInstance().dispatchEvent( fhe );
					return; // wait for success
				}
			}*/
			
			
		}
		
		public function  fault(rpcEvent:Object):void
		{
			
			var errorStatus:String = "Fault occured in SavefamilyHistoryCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		public function ManagePatientFamilyHistoryCommand()
		{
		}
	}
}