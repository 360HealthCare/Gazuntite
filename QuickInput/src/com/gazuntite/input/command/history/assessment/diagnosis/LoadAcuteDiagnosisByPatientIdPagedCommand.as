package com.gazuntite.input.command.history.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.assessment.diagnosis.LoadAcuteDiagnosisByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadAcuteDiagnosisByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadAcuteDiagnosisByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var page:PageDTO = new PageDTO();//model.diagnosisAcuteCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var pageXML:XML = page.toXML();
				
				var delegate:LoadAcuteDiagnosisByPatientIdPagedDelegate = new LoadAcuteDiagnosisByPatientIdPagedDelegate(this);
				delegate.loadAcuteDiagnosisByPatientIdPaged(pageXML, model.patientDTO.ID, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var acutePageDTO:XML = XML(re.result);
					
					var xList:XMLList = acutePageDTO.children();
					
					var aList:XML = xList[0];
					
					var acuteList:XMLList = aList.children();
					
					if (acuteList)
					{
						var diagnosisDTOList:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in acuteList)
						{
							var diagnosisDTO:DiagnosisDTO = new DiagnosisDTO();
							
							diagnosisDTO.serialNumber = i++;
							diagnosisDTO.showActiveField = true;
							
							diagnosisDTO.FromXML(x);
							
							diagnosisDTOList.addItem(diagnosisDTO);
						}
						
						model.diagnosisDTOAcuteHistoryList = diagnosisDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.diagnosisAcuteCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadDiagnosisAcuteByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadDiagnosisAcuteByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId ) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}