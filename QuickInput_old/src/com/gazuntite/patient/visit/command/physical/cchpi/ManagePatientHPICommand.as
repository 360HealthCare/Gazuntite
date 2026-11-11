package com.gazuntite.patient.visit.command.physical.cchpi
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.physical.cchpi.ManagePatientHPIDelegate;
	import com.gazuntite.patient.visit.dto.HPI_CCDTO;
	import com.gazuntite.patient.visit.event.physical.cchpi.LoadPatientHPIByVisitIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientHPICommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientHPIDelegate = new ManagePatientHPIDelegate( this );
				
				
				if(model.HPI_CCDTOList!=null)
				{				
					
					var i:int;
					for(i=0;i<model.HPI_CCDTOList.length;i++)
					{
						var hpidto:HPI_CCDTO = model.HPI_CCDTOList.getItemAt(i) as HPI_CCDTO;
						
						if(hpidto.VisitDate == null)
						{
							hpidto.VisitDate= Constants.NULL_DATE;
						}
						
						hpidto.ModifiedBy = model.LoggedInUserId;
						hpidto.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for(i=0;i<model.HPI_CCDTOList.length;i++)
					{
						var HPIDTO:HPI_CCDTO = model.HPI_CCDTOList.getItemAt(i) as HPI_CCDTO;
						
						if(HPIDTO.IsDeleted == true || HPIDTO.IsDirty == true)
						{
							
							newList.addItem(HPIDTO);
						}
						
					}
					if(newList.length>0)
						delegate.ManagePatientHPI(newList,model.LoggedInUserId ,model.patientID , model.VisitID,model.ClinicBranchIdSeq, actionDate, model.LoggedInUserSessionID);
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
					trace( "ManagePatientHPI Saved." );
					var lpviEvent: LoadPatientHPIByVisitIdEvent = new LoadPatientHPIByVisitIdEvent(); 
					CairngormEventDispatcher.getInstance().dispatchEvent( lpviEvent );
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientHPI \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManagePatientHPI.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		public function ManagePatientHPICommand()
		{
		}
	}
}