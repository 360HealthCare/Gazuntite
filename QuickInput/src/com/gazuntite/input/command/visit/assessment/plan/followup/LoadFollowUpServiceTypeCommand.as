package com.gazuntite.input.command.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.followUp.FollowUpServiceTypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.followup.LoadFollowUpServiceTypeDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpServiceTypeEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class LoadFollowUpServiceTypeCommand implements Command , IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var followUpDataControlTypeID:int;
		
		public function LoadFollowUpServiceTypeCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			var delegate:LoadFollowUpServiceTypeDelegate  = new LoadFollowUpServiceTypeDelegate(this);
			var LE:LoadFollowUpServiceTypeEvent = cgEvent as LoadFollowUpServiceTypeEvent;
			
			followUpDataControlTypeID = LE.followupDataControlTypeID;
			
			delegate.LoadServiceType(model.LoggedInUserSessionID,
						LE.followupDataControlTypeID, model.LoggedInUserSelectedBranchId, LE.searchTerm);
		}
		
		public function result(rpcEvent : Object):void
		{
			var serviceTypes:ArrayCollection  =new ArrayCollection();
			
			var ResultXml:XML = rpcEvent.result as XML
			
			if (!ResultXml)
				return;
			
			var FollowUpServiceTypesList:XMLList = ResultXml.ResponseData.ServiceTypeDTO;
			
			for (var i:int = 0; i < FollowUpServiceTypesList.length(); i++ )
			{
				var ct:FollowUpServiceTypeDTO = new FollowUpServiceTypeDTO();
				ct.FromXML(FollowUpServiceTypesList[i]);
				serviceTypes.addItem(ct);
			}
			
			if (followUpDataControlTypeID == 1)
			{
				model.followUpServiceTypeList = serviceTypes;
			}
			else if (followUpDataControlTypeID == 2)
			{
				model.followUpServiceDateList = serviceTypes;
			}
		}
		
		public function fault(rpcEvent:Object):void
		{			
			var errorStatus:String = "Fault occured in LoadFollowUpServiceTypeCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}