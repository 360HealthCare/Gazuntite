package com.gazuntite.patient.visit.command.physical.vitals
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.vitals.ManagePatientVitalDelegate;
	import com.gazuntite.patient.visit.dto.VitalsDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientVitalCommand  implements Command, IResponder 
	{
		
		[Bindable]
		private var model :QIModelLocator = QIModelLocator.getInstance();
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientVitalDelegate = new ManagePatientVitalDelegate( this );
				
				//var LE:ManagePatientVitalsEvent = cgEvent as ManagePatientVitalsEvent;
				if(model.VitalDTO!=null)
				{		
					/*model.VitalDTO.filterFunction = null;
					model.VitalDTO.refresh();*/
					
					var i:int;
					var newList:ArrayCollection = new ArrayCollection();
					
						var dto:VitalsDTO = model.VitalDTO/*getItemAt(i) */as VitalsDTO;
						
						if(dto.IsDeleted == true || dto.IsDirty == true)
						{
							dto.ModifiedBy = model.LoggedInUserId;		
							dto.ModifiedAt = new Date();
							newList.addItem(dto);
						}
					
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					if(newList.length>0)
						delegate.ManagePatientVitals(newList,model.LoggedInUserId,model.VisitID ,actionDate , model.LoggedInUserSessionID);
				}
				
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					UtilityFunctions.ShowMessage( "Vitals Saved.", "Info" )
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientVitals \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
			else
			{
				/*UtilityFunctions.ShowMessage("ManagePatientImmunization \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");*/
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManageVitalsCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		public function ManagePatientVitalCommand()
		{
		}
	}
}