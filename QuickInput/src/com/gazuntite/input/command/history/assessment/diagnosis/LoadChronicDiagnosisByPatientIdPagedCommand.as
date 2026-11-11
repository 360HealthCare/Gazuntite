package com.gazuntite.input.command.history.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.assessment.diagnosis.LoadChronicDiagnosisByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadChronicDiagnosisByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadChronicDiagnosisByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var page:PageDTO = new PageDTO();//model.diagnosisChronicCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var pageXML:XML = page.toXML();
				
				var delegate:LoadChronicDiagnosisByPatientIdPagedDelegate = new LoadChronicDiagnosisByPatientIdPagedDelegate(this);
				delegate.loadChronicDiagnosisByPatientIdPaged(pageXML, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var chronicPageDTO:XML = XML(re.result);
					
					var xList:XMLList = chronicPageDTO.children();
					
					var cList:XML = xList[0];
					
					var chronicList:XMLList = cList.children();
					
					if (chronicList)
					{
						var diagnosisDTOList:ArrayCollection = new ArrayCollection();
						
						var i:int = 1;
						
						for each (var x:XML in chronicList)
						{
							var diagnosisDTO:DiagnosisDTO = new DiagnosisDTO();
							
							diagnosisDTO.serialNumber = i++;
							diagnosisDTO.showActiveField = true;
							
							diagnosisDTO.FromXML(x);
							
							diagnosisDTOList.addItem(diagnosisDTO);
						}
						
						model.diagnosisDTOChronicHistoryList = diagnosisDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.diagnosisChronicCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadDiagnosisChronicByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadDiagnosisChronicByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}