package com.gazuntite.input.command.history.assessment.treatment
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.assessment.treatment.LoadProcedureByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadProcedureByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadProcedureByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var page:PageDTO = new PageDTO();//model.procedureCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var pageXML:XML = page.toXML();
				
				var delegate:LoadProcedureByPatientIdPagedDelegate = new LoadProcedureByPatientIdPagedDelegate(this);
				delegate.loadProcedureByPatientIdPaged(pageXML, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID, true);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var procedurePageDTO:XML = XML(re.result);
					
					var xList:XMLList = procedurePageDTO.children();
					
					var pList:XML = xList[0];
					
					var procedureList:XMLList = pList.children();
					
					if (procedureList)
					{
						var procedureDTOList:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in procedureList)
						{
							var procedureDTO:ProcedureDTO = new ProcedureDTO();
							
							procedureDTO.serialNumber = i++;
							
							procedureDTO.FromXML(x);
							
							procedureDTOList.addItem(procedureDTO);
						}
						
						model.procedureDTOHistoryList = procedureDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.procedureCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadProcedureByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadProcedureByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}