package com.gazuntite.patient.visit.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.visit.MarkValidDataExistsDelegate;
	import com.gazuntite.patient.visit.event.visit.MarkValidDataExistsEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class MarkValidDataExistsCommand implements Command , IResponder
	{
		[Bindable] private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var functionName : Function;
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var LE : MarkValidDataExistsEvent = cgEvent as MarkValidDataExistsEvent;
				var delegate : MarkValidDataExistsDelegate = new MarkValidDataExistsDelegate( this );
				delegate.MarkValidData(model.VisitID, model.placeOfServiceID, model.EncounterTypeId, UtilityFunctions.FormatDate(model.VisitDate, 'MM-DD-YYYY'),  model.LoggedInUserSessionID);
				functionName = LE.functionName;
			}
		}	
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					UtilityFunctions.ShowMessage( "Visit Saved successfully.", "Visit Saved" )
						
					if(this.functionName!=null)
					{
						functionName();
					}
					model.updateVBVisiList = true;
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
			var errorStatus:String = "Fault occured in MarkValidDataExsistCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}