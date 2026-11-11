package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.visit.MarkValidDataExistsDelegate;
	import com.gazuntite.input.event.visit.visit.MarkValidDataExistsEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class MarkValidDataExistsCommand implements Command , IResponder
	{
		[Bindable] private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var functionName : Function;
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if (model.LoggedInUserId)
			{
				var LE : MarkValidDataExistsEvent = cgEvent as MarkValidDataExistsEvent;
				functionName = LE.functionName;
				
				//Ayesha--09/07/2013
				// for the time being, hard coded values will be given to service of EncounterTypeId, and PlaceOfServiceID, utill its implementation is pending
				model.placeOfServiceID = 10;
				model.EncounterTypeId = 10;
				
				var delegate : MarkValidDataExistsDelegate = new MarkValidDataExistsDelegate(this);
				delegate.MarkValidData(LE.visitID, model.placeOfServiceID, model.EncounterTypeId, UtilityFunctions.FormatDate(new Date(LE.visitDate), 'MM-DD-YYYY'),  model.LoggedInUserSessionID);
				CursorManager.setBusyCursor();
			}
		}	
		
		public function result(rpcEvent:Object):void
		{
			CursorManager.removeBusyCursor();
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result.@Status == "true")
				{
					UtilityFunctions.ShowMessage( "Visit has been saved successfully.", "Info", function():void
					{
						if (functionName != null)
						{
							functionName();
						}
					});
					
					//model.updateVBVisiList = true;
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientImmunization \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
			else
			{
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			CursorManager.removeBusyCursor();
			var errorStatus:String = "Fault occured in MarkValidDataExsistCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}