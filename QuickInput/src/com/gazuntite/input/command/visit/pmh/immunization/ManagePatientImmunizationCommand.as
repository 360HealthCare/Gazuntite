package com.gazuntite.input.command.visit.pmh.immunization
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.pmh.immunization.ImmunizationDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.pmh.immunization.ManagePatientImmunizationDelegate;
	import com.gazuntite.input.event.visit.pmh.immunization.LoadImmunizationByVisitIDEvent;
	import com.gazuntite.input.event.visit.pmh.immunization.ManagePatientImmunizationEvent;
	import com.gazuntite.input.event.visit.visit.GetVisitChargesEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientImmunizationCommand implements Command , IResponder
	{
		[Bindable] 
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if (model.LoggedInUserId)
			{
				var delegate : ManagePatientImmunizationDelegate = new ManagePatientImmunizationDelegate( this );
				var LE:ManagePatientImmunizationEvent = cgEvent as ManagePatientImmunizationEvent;
				
				if (model.immunizationDTOList!=null)
				{				
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for(var i:int=0;i<model.immunizationDTOList.length;i++)
					{
						var immDTO:ImmunizationDTO = model.immunizationDTOList.getItemAt(i) as ImmunizationDTO;
						
						if(immDTO.IsDeleted == true || immDTO.IsDirty == true)
						{
							if(immDTO.DateAdmin == null)
							{
								immDTO.DateAdmin= QIConstants.NULL_DATE.toDateString();
							}
							if(immDTO.NextDoseDue == null)
							{
								immDTO.NextDoseDue= QIConstants.NULL_DATE.toDateString();
							}
							if(immDTO.VisitDate == null)
							{
								immDTO.VisitDate= QIConstants.NULL_DATE;
							}
							if(immDTO.ExpiryDate == null)
							{
								immDTO.ExpiryDate= QIConstants.NULL_DATE.toDateString();
							}
							
							immDTO.ModifiedBy = model.LoggedInUserId;
							immDTO.ModifiedAt = new Date();
							
							newList.addItem(immDTO);
						}
					}
					if(newList.length > 0)
						delegate.ManagePatientImmunization(newList, model.LoggedInUserId, model.VisitID, actionDate, model.LoggedInUserSessionID);
				}
			}
		}	
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result.@Status == "true")
				{
					//[07/19/2013] Shahid Munir, to update visit charges in super bill
					var gvce:GetVisitChargesEvent = new GetVisitChargesEvent(model.VisitID); 
					CairngormEventDispatcher.getInstance().dispatchEvent(gvce);
					
					var lpviEvent:LoadImmunizationByVisitIDEvent = new LoadImmunizationByVisitIDEvent(); 
					CairngormEventDispatcher.getInstance().dispatchEvent(lpviEvent);
				}
				else
					UtilityFunctions.ShowMessage("ManagePatientImmunization \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManageImmunizationCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
	}
}