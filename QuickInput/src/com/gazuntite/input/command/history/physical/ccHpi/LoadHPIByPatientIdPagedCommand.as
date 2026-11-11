package com.gazuntite.input.command.history.physical.ccHpi
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.physical.ccHpi.LoadHPIByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.event.history.physical.ccHpi.LoadHPIByPatientIdPagedEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadHPIByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadHPIByPatientIdPagedEvent;
		
		public function LoadHPIByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				LE = event as LoadHPIByPatientIdPagedEvent;
				
				var page:PageDTO = new PageDTO();//model.HPI_CCCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var xml2Send:XML = page.toXML();
				
				var delegate:LoadHPIByPatientIdPagedDelegate = new LoadHPIByPatientIdPagedDelegate(this);
				delegate.loadHPIByPatientIdPaged(xml2Send, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID, true);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var hpiCcPageDTO:XML = XML(re.result);
					
					var xList:XMLList = hpiCcPageDTO.children();
					
					var ccList:XML = xList[0];
					
					var hpiCcList:XMLList = ccList.children();
					
					if (hpiCcList)
					{
						var hpiCcDTOList:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in hpiCcList)
						{
							var chiefComplaintHpiDTO:ChiefComplaintHpiDTO = new ChiefComplaintHpiDTO();
							chiefComplaintHpiDTO.serialNumber = i++;
							
							chiefComplaintHpiDTO.FromXML(x);
							
							hpiCcDTOList.addItem(chiefComplaintHpiDTO);
						}
						
						model.chiefComplaintHpiDTOHistoryList = hpiCcDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.HPI_CCCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadHPIByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadHPIByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId ) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}