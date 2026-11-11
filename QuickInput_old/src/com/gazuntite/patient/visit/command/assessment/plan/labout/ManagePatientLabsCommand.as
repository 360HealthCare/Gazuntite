package com.gazuntite.patient.visit.command.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.assessment.plan.labout.ManagePatientLabsDelegate;
	import com.gazuntite.patient.visit.dto.LabDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.labout.LoadPatientLabsByVisitEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientLabsCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function ManagePatientLabsCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientLabsDelegate= new ManagePatientLabsDelegate( this );
				
				
				if(model.laboutDTOList!=null)
				{				
					
					var i:int;
					for(i=0;i<model.laboutDTOList.length;i++)
					{
						var laboutDTO:LabDTO =model.laboutDTOList.getItemAt(i) as LabDTO;
						
						if(laboutDTO.VisitDate == null)
						{
							laboutDTO.VisitDate= Constants.NULL_DATE;
						}
						
						laboutDTO.ModifiedBy = model.LoggedInUserId;
						laboutDTO.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					
					for(i=0;i<model.laboutDTOList.length;i++)
					{
						var laboutDTO:LabDTO = model.laboutDTOList.getItemAt(i) as LabDTO;
						
						if(laboutDTO.IsDeleted == true || laboutDTO.IsDirty == true)
						{
							newList.addItem(laboutDTO);
						}
						
					}
					if(newList.length>0)
						delegate.ManagelaboutDTO(newList, model.LoggedInUserSessionID);
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
					//UtilityFunctions.ShowMessage( "ManagePatientLabOut Saved.", "Info" )
					var lpihEvent: LoadPatientLabsByVisitEvent = new LoadPatientLabsByVisitEvent(); 
					CairngormEventDispatcher.getInstance().dispatchEvent( lpihEvent );
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientLabOut \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManagePatientLabOut.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
	}
}