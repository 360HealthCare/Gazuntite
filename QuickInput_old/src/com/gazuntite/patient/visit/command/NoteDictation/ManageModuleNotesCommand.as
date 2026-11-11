package com.gazuntite.patient.visit.command.NoteDictation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.NoteDictation.ManageModuleNotesDelegate;
	import com.gazuntite.patient.visit.dto.ModuleNoteDTO;
	import com.gazuntite.patient.visit.event.NotesDictation.LoadModuleNotesByVisitIdEvent;
	import com.gazuntite.patient.visit.event.NotesDictation.ManageModuleNotesEvent;
	import com.gazuntite.patient.visit.event.physical.cchpi.LoadPatientHPIByVisitIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManageModuleNotesCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:ManageModuleNotesEvent;
		private var notesDTO:ModuleNoteDTO;
		public function ManageModuleNotesCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				LE = cgEvent as ManageModuleNotesEvent;
				notesDTO = LE.notesDTO;
				var delegate : ManageModuleNotesDelegate = new ManageModuleNotesDelegate( this );
				
				var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
				
				if(notesDTO)
					delegate.ManageNotes(notesDTO , model.LoggedInUserId,model.VisitID ,actionDate , model.LoggedInUserSessionID);
			}
		}	
	
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					UtilityFunctions.ShowMessage( "Notes Saved.", "Info" )
						
					/*var NV: LoadModuleNotesByVisitIdEvent = new LoadModuleNotesByVisitIdEvent();
					CairngormEventDispatcher.getInstance().dispatchEvent(NV);*/
					
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManageNotes \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManageNotes.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}