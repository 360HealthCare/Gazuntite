package com.gazuntite.input.command.visit.physical.cchpi
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.event.history.physical.ccHpi.LoadHPIByPatientIdPagedEvent;
	import com.gazuntite.input.delegate.visit.physical.cchpi.ManagePatientHPIDelegate;
	import com.gazuntite.input.event.visit.physical.cchpi.LoadPatientHPIByVisitIdEvent;
	import com.gazuntite.input.event.visit.physical.cchpi.ManagePatientHPIEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientHPICommand implements Command , IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var sectionName:String;
		
		public function ManagePatientHPICommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var LE:ManagePatientHPIEvent = cgEvent as ManagePatientHPIEvent;
				var delegate:ManagePatientHPIDelegate = new ManagePatientHPIDelegate(this);
				var arrCol:ArrayCollection;
				
				sectionName = LE.sectionName;
				
				switch (sectionName)
				{
					case QIConstants.INPUT_VIEW:
						
						arrCol = model.chiefComplaintHpiDTOList;
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						arrCol = model.chiefComplaintHpiDTOHistoryList;
						break;
				}
				
				if (arrCol != null)
				{				
					var chiefComplaintHpiDTO:ChiefComplaintHpiDTO;
					var i:int;
					
					for (i = 0; i < arrCol.length; i++)
					{
						chiefComplaintHpiDTO = arrCol.getItemAt(i) as ChiefComplaintHpiDTO;
						
						if (chiefComplaintHpiDTO.VisitDate == null)
						{
							chiefComplaintHpiDTO.VisitDate = QIConstants.NULL_DATE;
						}
						
						chiefComplaintHpiDTO.ModifiedBy = model.LoggedInUserId;
						chiefComplaintHpiDTO.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate(new Date(), "MM-DD-YYYY");
					
					for (i = 0; i < arrCol.length; i++)
					{
						chiefComplaintHpiDTO = arrCol.getItemAt(i) as ChiefComplaintHpiDTO;
						
						if (chiefComplaintHpiDTO.IsDeleted == true || chiefComplaintHpiDTO.IsDirty == true)
						{	
							newList.addItem(chiefComplaintHpiDTO);
						}
						
					}
					if (newList.length > 0)
						delegate.ManagePatientHPI(newList, 
							model.LoggedInUserId, model.patientDTO.ID, model.VisitID, model.LoggedInUserSelectedBranchId, actionDate, model.LoggedInUserSessionID);
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
					
					switch (sectionName)
					{
						case QIConstants.INPUT_VIEW:
							
							var lphpiEv: LoadPatientHPIByVisitIdEvent = new LoadPatientHPIByVisitIdEvent(); 
							CairngormEventDispatcher.getInstance().dispatchEvent(lphpiEv);
							
							break;
						
						case QIConstants.HISTORY_VIEW:
							
							var lpccEv:LoadHPIByPatientIdPagedEvent = new LoadHPIByPatientIdPagedEvent();
							CairngormEventDispatcher.getInstance().dispatchEvent(lpccEv);
							
							break;
					}
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientHPI \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in ManagePatientHPI.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);
		}
	}
}