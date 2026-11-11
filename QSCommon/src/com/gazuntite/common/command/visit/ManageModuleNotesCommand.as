package com.gazuntite.common.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.delegate.visit.ManageModuleNotesDelegate;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.common.event.visit.ManageModuleNotesEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManageModuleNotesCommand implements Command , IResponder
	{		
		private var LE:ManageModuleNotesEvent;
		private var notesDTO:ModuleNoteDTO;
		private var sectionName:String;
		private var callBack:Function;
		private var loggedInUserId:int;
		
		public function ManageModuleNotesCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			
			LE = cgEvent as ManageModuleNotesEvent;
			
			notesDTO = LE.notesDTO;
			sectionName = LE.sectionName;
			loggedInUserId = LE.loggedInUserId;
			
			var delegate:ManageModuleNotesDelegate = new ManageModuleNotesDelegate(this);
			
			var actionDate:String = UtilityFunctions.FormatDate(new Date(), "MM-DD-YYYY");
			
			if(null != LE.callBack)
				this.callBack = LE.callBack;
			
			if (null != notesDTO)
			{
				notesDTO.ModifiedAt = new Date();
				delegate.ManageNotes(notesDTO, LE.loggedInUserId, notesDTO.VisitID, actionDate, LE.loggedInUserSessionID);
			}
			
		}	
		
		public function result(rpcEvent:Object):void
		{			
			var re:ResultEvent = rpcEvent as ResultEvent;
			
			if (re.result.@Status == "true")
			{
				//Alert.show("Notes Saved.", "Info", Alert.OK, FlexGlobals.topLevelApplication.mainContainer);
				
				if(null != callBack)
					callBack(true,sectionName);
				
				//[09/03/2013] Shahid Munir, following is handled in callback
				/*switch (sectionName)
				{
				case QIConstants.INPUT_VIEW:
				
				var NV:LoadModuleNotesByVisitIdEvent = new LoadModuleNotesByVisitIdEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(NV);
				
				break;
				}
				
				var ev:LoadModuleDictationNoteByPatientIDEvent = new LoadModuleDictationNoteByPatientIDEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(ev);*/
				
			}
				
			else
			{
				UtilityFunctions.ShowMessage("ManageNotes \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				if(null != callBack)
					callBack(false,sectionName);
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in ManageModuleNotesCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty(loggedInUserId)? -1:loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}