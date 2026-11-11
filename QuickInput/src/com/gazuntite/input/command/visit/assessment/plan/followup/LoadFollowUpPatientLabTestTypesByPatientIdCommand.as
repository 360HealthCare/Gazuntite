package com.gazuntite.input.command.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.followup.LoadFollowUpPatientLabTestTypesByPatientIdDelegate;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadFollowUpPatientLabTestTypesByPatientIdCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadFollowUpPatientLabTestTypesByPatientIdCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadFollowUpPatientLabTestTypesByPatientIdDelegate = new LoadFollowUpPatientLabTestTypesByPatientIdDelegate(this);
				delegate.LoadPatientLabTestsForFollowupByPatient(model.patientDTO.ID, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void 
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result.@Status == "false")
				{
					return;
				}
				
				var xml:XMLList = re.result.ResponseData;
				
				if (!xml)
					return;
				
				var xList:XMLList = xml.children();
				
				if (!xList)
					return;
				
				var dtoList:ArrayCollection = new ArrayCollection();
				
				for each (var x:XML in xList)
				{
					var dto:GeneralTypeDTO = new GeneralTypeDTO();
					
					dto.ID = x.@["PatientFollowUpLabID"];
					dto.Name = x.@["LabTestDescription"];
					
					dtoList.addItem(dto);
				}
				
				model.followUpLabsList = dtoList;
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in LoadFollowUpPatientLabTestTypesByPatientIdCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}