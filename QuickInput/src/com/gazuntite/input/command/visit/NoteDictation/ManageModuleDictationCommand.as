package com.gazuntite.input.command.visit.NoteDictation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ModuleDictationDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.NoteDictation.ManageModuleDictationDelegate;
	import com.gazuntite.input.event.visit.NotesDictation.ManageModuleDictationEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManageModuleDictationCommand implements Command , IResponder
	{ 
		//private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:ManageModuleDictationEvent;
		private var DTO:ModuleDictationDTO;
		private var sectionName:String;
		private var callBack:Function;
		private var loggedInUserId:int;
		private var branchId:int;
		
		public function ManageModuleDictationCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			LE = cgEvent as ManageModuleDictationEvent;
			
			DTO = LE.DTO;
			sectionName = LE.sectionName;
			loggedInUserId = LE.loggedInUserId;
			
			var delegate:ManageModuleDictationDelegate = new ManageModuleDictationDelegate(this);
			
			var actionDate:String = UtilityFunctions.FormatDate(new Date(), "MM-DD-YYYY");
			
			if(null != LE.callBack)
				this.callBack = LE.callBack;
			
			if (null != DTO)
			{
				DTO.ModifiedAt = new Date();
				delegate.ManageDictation(DTO, LE.loggedInUserId, branchId, DTO.VisitID, LE.loggedInUserSessionID);
			}
		}	
		
		public function result(rpcEvent:Object):void
		{
			var re:ResultEvent = rpcEvent as ResultEvent;
			
			if (re.result.@Status == "true")
			{
				if(null != callBack)
					callBack(true,sectionName);
			}				
			else
			{
				UtilityFunctions.ShowMessage("ManageDictation \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				if(null != callBack)
					callBack(false,sectionName);
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManageDictation.";			
			var userId:int = UtilityFunctions.IsNullOrEmpty(loggedInUserId)? -1:loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
			
		}
	}
}