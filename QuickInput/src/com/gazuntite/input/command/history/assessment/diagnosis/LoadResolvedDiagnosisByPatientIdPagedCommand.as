package com.gazuntite.input.command.history.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.assessment.diagnosis.LoadResolvedDiagnosisByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadResolvedDiagnosisByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadResolvedDiagnosisByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var page:PageDTO = new PageDTO();//model.diagnosisResolvedCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var pageXML:XML = page.toXML();
				
				var delegate:LoadResolvedDiagnosisByPatientIdPagedDelegate = new LoadResolvedDiagnosisByPatientIdPagedDelegate(this);
				delegate.loadResolvedDiagnosisByPatientIdPaged(pageXML, model.patientDTO.ID, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var resolvedPageDTO:XML = XML(re.result);
					
					var xList:XMLList = resolvedPageDTO.children();
					
					var rList:XML = xList[0];
					
					var resolvedList:XMLList = rList.children();
					
					if (resolvedList)
					{
						var diagnosisDTOList:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in resolvedList)
						{
							var diagnosisDTO:DiagnosisDTO = new DiagnosisDTO();
							
							diagnosisDTO.serialNumber = i++;
							diagnosisDTO.showActiveField = true;
							
							diagnosisDTO.FromXML(x);
							
							diagnosisDTOList.addItem(diagnosisDTO);
						}
						
						model.diagnosisDTOResolvedHistoryList = diagnosisDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.diagnosisResolvedCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadDiagnosisResolvedByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadDiagnosisResolvedByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}