package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.ManagePatientVitalDelegate;
	import com.gazuntite.common.dto.VitalsDTO;
	import com.gazuntite.common.event.ManagePatientVitalEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientVitalCommand  implements Command, IResponder 
	{
		private var le:ManagePatientVitalEvent;
		
		private var isToBeDeleted:Boolean = false;
		
		public function execute( cgEvent:CairngormEvent ) : void {
			
				le = cgEvent as ManagePatientVitalEvent;
				
				var delegate : ManagePatientVitalDelegate = new ManagePatientVitalDelegate( this );
				
				if (le.VitalDTO != null)
				{		
					
					var dto:VitalsDTO = le.VitalDTO as VitalsDTO;
					
					isToBeDeleted = dto.IsDeleted;
					
					if (dto.IsDeleted == true || dto.IsDirty == true)
					{
						dto.ModifiedBy = le.UserID;		
						dto.ModifiedAt = new Date();
						
						var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
						
						delegate.ManagePatientVitals(dto,le.UserID,le.VisitID ,actionDate , le.SessionID);
						
					}
				}
				
			
		}
		
		public function result(rpcEvent:Object):void
		{
			var re:ResultEvent = rpcEvent as ResultEvent;
			
			var msgPart:String = "Saved";
			 
			if (isToBeDeleted)
				 msgPart = "Deleted";
			
			if (re.result.@Status == "true")
			{
				//UtilityFunctions.ShowMessage( "Vitals " + msgPart + " Successfully.", "Info" );
				
				if (null != le.Callback)
					le.Callback(true);
			}
				
			else
			{
				UtilityFunctions.ShowMessage("ManagePatientVitals \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
			}
			
			CursorManager.removeBusyCursor();
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManageVitalsCommand.";
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), 0); 
			
			CursorManager.removeBusyCursor();
		}
		
		public function ManagePatientVitalCommand()
		{
		}
	}
}