package com.gazuntite.input.command.history.assessment.plan.followUp
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.followUp.FollowUpDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.history.assessment.plan.followUp.LoadFollowUpByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadFollowUpByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadFollowUpByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var page:PageDTO = new PageDTO();//model.followUpCurrentPageByPatient;
				
				if (!page)
					return;
				
				if (page && page.stationIDs && page.stationIDs.length < 1)
					page.stationIDs.addItem(model.LoggedInUserSelectedStationID);
				
				var pageXML:XML = page.toXML();
				
				var delegate:LoadFollowUpByPatientIdPagedDelegate = new LoadFollowUpByPatientIdPagedDelegate(this);
				delegate.loadFollowUpByPatientIdPaged(pageXML, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID, true);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var followUpPageDTO:XML = XML(re.result);
					
					var xList:XMLList = followUpPageDTO.children();
					
					var fList:XML = xList[0];
					
					var followUpList:XMLList = fList.children();
					
					if (followUpList)
					{
						var followUpDTOList:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in followUpList)
						{
							var followUpDTO:FollowUpDTO = new FollowUpDTO();
							
							followUpDTO.serialNumber = i++;
							followUpDTO.FromXML(x);
							
							followUpDTOList.addItem(followUpDTO);
						}
						
						model.followUpDTOHistoryList = followUpDTOList;
					}
					
					var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					//model.followUpCurrentPageByPatient = pageDTO;
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadFollowUpByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadFollowUpByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}