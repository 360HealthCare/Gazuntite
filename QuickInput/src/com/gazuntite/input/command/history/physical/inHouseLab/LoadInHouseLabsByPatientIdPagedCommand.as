package com.gazuntite.input.command.history.physical.inHouseLab
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.physical.inHouseLab.LoadInHouseLabsByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.event.history.physical.inHouseLab.LoadInHouseLabsByPatientIdPagedEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadInHouseLabsByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		private var LE:LoadInHouseLabsByPatientIdPagedEvent;
		
		public function LoadInHouseLabsByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				LE = event as LoadInHouseLabsByPatientIdPagedEvent;
				
				var page:PageDTO = new PageDTO();//model.inHouseLabCurrentPageByPatient;
				page.pageSize = 1000;
				page.pageNumber = 1;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var xml2Send:XML = page.toXML();
				
				var delegate:LoadInHouseLabsByPatientIdPagedDelegate = new LoadInHouseLabsByPatientIdPagedDelegate(this);
				delegate.loadPatientInHouseLabsByPatientIdPaged(xml2Send, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID, true);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var inHouseLabPageDTO:XML = XML(re.result);
					
					var xList:XMLList = inHouseLabPageDTO.children();
					
					var lList:XML = xList[0];
					
					var inHouseLabList:XMLList = lList.children();
					
					var i:int = 1;
					
					if (inHouseLabList)
					{
						var labInDTOList:ArrayCollection = new ArrayCollection();
						
						for each (var x:XML in inHouseLabList)
						{
							var inHouseLabDTO:InHouseLabDTO = new InHouseLabDTO();
							inHouseLabDTO.serialNumber = i++;
							
							inHouseLabDTO.FromXML(x);
							
							labInDTOList.addItem(inHouseLabDTO);
						}
						
						model.inHouseLabDTOHistoryList = labInDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.inHouseLabCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadInHouseLabsByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadInHouseLabsByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId ) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}