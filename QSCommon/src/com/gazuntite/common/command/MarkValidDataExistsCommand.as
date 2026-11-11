package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.MarkValidDataExistsDelegate;
	import com.gazuntite.common.event.MarkValidDataExistsEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class MarkValidDataExistsCommand implements Command , IResponder
	{
		
		public var functionName : Function;
		
		private var LE : MarkValidDataExistsEvent;
		
		public function execute( cgEvent:CairngormEvent ) : void {
			
			LE  = cgEvent as MarkValidDataExistsEvent;
			
			if (LE.LoggedInUserId)
			{
				functionName = LE.functionName;
				
				//Ayesha--09/07/2013
				// for the time being, hard coded values will be given to service of EncounterTypeId, and PlaceOfServiceID, utill its implementation is pending
				
				var delegate : MarkValidDataExistsDelegate = new MarkValidDataExistsDelegate(this);
				delegate.MarkValidData(LE.visitID, LE.placeOfServiceID, LE.EncounterTypeId, UtilityFunctions.FormatDate(new Date(LE.visitDate), 'MM-DD-YYYY'),  LE.LoggedInUserSessionID);
			}
		}	
		
		public function result(rpcEvent:Object):void
		{
			if (LE.LoggedInUserId)
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
			var errorStatus:String = "Fault occured in MarkValidDataExsistCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( LE.LoggedInUserId )? -1:LE.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}