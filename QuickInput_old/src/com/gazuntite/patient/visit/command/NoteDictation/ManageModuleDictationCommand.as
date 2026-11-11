package com.gazuntite.patient.visit.command.NoteDictation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.NoteDictation.ManageModuleDictationDelegate;
	import com.gazuntite.patient.visit.dto.ModuleDictationDTO;
	import com.gazuntite.patient.visit.event.NotesDictation.LoadModuleDictationByVisitIdEvent;
	import com.gazuntite.patient.visit.event.NotesDictation.ManageModuleDictationEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManageModuleDictationCommand implements Command , IResponder
	{ 
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:ManageModuleDictationEvent;
		private var DTO:ModuleDictationDTO;
		
		public function ManageModuleDictationCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				LE = cgEvent as ManageModuleDictationEvent;
				DTO = LE.DTO;
				var delegate : ManageModuleDictationDelegate = new ManageModuleDictationDelegate( this );
				
				if(DTO)
					delegate.ManageDictation(DTO , model.LoggedInUserId,model.LoggedInUserSelectedBranchId ,model.VisitID , model.LoggedInUserSessionID);
			}
		}	
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					UtilityFunctions.ShowMessage( "Dictation Saved.", "Info" )
						
					/*var DE: LoadModuleDictationByVisitIdEvent= new LoadModuleDictationByVisitIdEvent();
					CairngormEventDispatcher.getInstance().dispatchEvent(DE);*/
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManageDictation \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManageDictation.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}