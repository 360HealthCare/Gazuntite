package com.gazuntite.input.command.visit.physical.physical
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.physical.LoadPhysicalsByPatientIdPagedDelegate;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPhysicalsByPatientIdPagedCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadPhysicalsByPatientIdPagedCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				if (!model.physicalsCurrentPageByPatient)
					return;
				
				var pageXML:XML = model.physicalsCurrentPageByPatient.toXML();
				
				var delegate:LoadPhysicalsByPatientIdPagedDelegate = new LoadPhysicalsByPatientIdPagedDelegate(this);
				delegate.loadPhysicalsByPatientIdPaged(pageXML, model.patientDTO.ID, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID, true);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result)
				{
					var physicalsPageDTO:XML = XML(re.result);
					
					var xList:XMLList = physicalsPageDTO.children();
					
					var pList:XML = xList[0];
					
					var physicalsList:XMLList = pList.children();
					
					if (physicalsList)
					{
						var physicalDTOList:ArrayCollection = new ArrayCollection();
						var serialNumber:int = 1;
						for each (var x:XML in physicalsList)
						{
							var physicalDTO:PhysicalDTO = new PhysicalDTO();
							physicalDTO.serialNumber = serialNumber ++;
							physicalDTO.FromXML(x);
							
							physicalDTOList.addItem(physicalDTO);
						}
						
						model.physicalHistoryDTOList = null;
						model.physicalHistoryDTOList = new ArrayCollection();
						
						model.physicalHistoryDTOList = physicalDTOList;
					}
					
					//TH: uncomment following lines when paging is implemented 
					/*var pageDTO:PageDTO = new PageDTO();
					pageDTO.fromXML(xList[1]);
					
					model.physicalsCurrentPageByPatient = pageDTO;*/
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadPhysicalsByPatientIdPaged \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadPhysicalsByPatientIdPaged.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId ) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}