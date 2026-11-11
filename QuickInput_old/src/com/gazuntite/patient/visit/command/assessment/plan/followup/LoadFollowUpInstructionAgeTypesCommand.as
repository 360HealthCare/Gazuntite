package com.gazuntite.patient.visit.command.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.followup.LoadFollowUpInstructionAgeTypesDelegate;
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.followup.LoadFollowUpInstructionAgeTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadFollowUpInstructionAgeTypesCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadFollowUpInstructionAgeTypesEvent;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadFollowUpInstructionAgeTypesDelegate = new  LoadFollowUpInstructionAgeTypesDelegate(this);
				
				LE = cgEvent as LoadFollowUpInstructionAgeTypesEvent;
				
				delegate.LoadLabOutOderMethodTypeData(model.LoggedInUserSessionID );
			}
			
		}
		
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				
				trace( "onSuccess start "  )		
				
				var Types:ArrayCollection  =new ArrayCollection();
				
				var ResultXml:XML = rpcEvent.result as XML
				
				var FollowUpServiceTypesList:XMLList = ResultXml.ResponseData.InstructionAgeTypeDTO ;
				
				
				for(var i:int = 0 ; i < FollowUpServiceTypesList.length(); i++ )
				{
					var ct:GeneralTypeDTO = new GeneralTypeDTO();
					ct.FromXML( FollowUpServiceTypesList[i] );
					Types.addItem( ct );
				}
				
				model.followUpinstructionAgeTypeDTOList = Types;
				
				
				trace( "model updated "  )
				
				trace( "on result found record ",Types.length );
			
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in FollowupInstructionAgeType.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		
		public function LoadFollowUpInstructionAgeTypesCommand()
		{
		}
	}
}