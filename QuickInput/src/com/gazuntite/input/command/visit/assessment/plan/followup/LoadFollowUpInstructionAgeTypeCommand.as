package com.gazuntite.input.command.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.followup.LoadFollowUpInstructionAgeTypeDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpInstructionAgeTypeEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class LoadFollowUpInstructionAgeTypeCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadFollowUpInstructionAgeTypeEvent;
		
		public function LoadFollowUpInstructionAgeTypeCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadFollowUpInstructionAgeTypeDelegate = new  LoadFollowUpInstructionAgeTypeDelegate(this);
				
				LE = cgEvent as LoadFollowUpInstructionAgeTypeEvent;
				
				delegate.LoadLabOutOderMethodTypeData(model.LoggedInUserSessionID );
			}	
		}
		
		public function result(rpcEvent:Object):void 
		{
			if (model.LoggedInUserId)
			{
				var Types:ArrayCollection = new ArrayCollection();
				
				var ResultXml:XML = rpcEvent.result as XML
				
				if (!ResultXml)
					return;
				
				var FollowUpServiceTypesList:XMLList = ResultXml.ResponseData.InstructionAgeTypeDTO ;
				
				if (!FollowUpServiceTypesList)
					return;
				
				for (var i:int = 0 ; i < FollowUpServiceTypesList.length(); i++ )
				{
					var ct:GeneralTypeDTO = new GeneralTypeDTO();
					ct.FromXML(FollowUpServiceTypesList[i]);
					Types.addItem(ct);
				}
				
				model.followUpInstructionAgeTypeDTOList = Types;
			}
		}
		
		public function fault( rpcEvent:Object):void 
		{	
			var errorStatus:String = "Fault occured in FollowupInstructionAgeType.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);
		}
	}
}