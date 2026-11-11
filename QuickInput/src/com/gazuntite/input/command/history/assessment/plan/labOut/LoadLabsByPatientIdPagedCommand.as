package com.gazuntite.input.command.history.assessment.plan.labOut
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.assessment.plan.labOut.LoadLabsByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.event.history.assessment.plan.labOut.LoadLabsByPatientIdPagedEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadLabsByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadLabsByPatientIdPagedEvent;
		
		public function LoadLabsByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				LE = event as LoadLabsByPatientIdPagedEvent;
				
				var page:PageDTO = new PageDTO();//model.labOutCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var xml2Send:XML = page.toXML();
				
				var delegate:LoadLabsByPatientIdPagedDelegate = new LoadLabsByPatientIdPagedDelegate(this);
				delegate.loadPatientLabsByPatientId(xml2Send, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID, true);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var labPageDTO:XML = XML(re.result);
					
					var xList:XMLList = labPageDTO.children();
					
					var lList:XML = xList[0];
					
					var labList:XMLList = lList.children();
					
					if (labList)
					{
						var labDTOList:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in labList)
						{
							var labDTO:LabDTO = new LabDTO();
							
							labDTO.serialNumber = i++;
							labDTO.FromXML(x);
							
							labDTOList.addItem(labDTO);
						}
						
						model.labDTOHistoryList = labDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.labOutCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadLabsByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadLabsByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId ) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}