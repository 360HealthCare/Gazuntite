package com.gazuntite.patient.visit.command.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.followup.LoadFollowUpServiceTypeDelegate;
	import com.gazuntite.patient.visit.dto.FollowUpServiceTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.followup.LoadFollowUpServiceTypeEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadFollowUpServiceTypeCommand implements Command , IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		//private var responder:Responder;
		
		private var delegate:LoadFollowUpServiceTypeDelegate;		
		private var followUpDataControlTypeID:int;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			//responder = new Responder(onSuccess, onError);	
			
			delegate  = new LoadFollowUpServiceTypeDelegate( this );			
			
			var LE:LoadFollowUpServiceTypeEvent = cgEvent as LoadFollowUpServiceTypeEvent;
			
			followUpDataControlTypeID = LE.followupDataControlTypeID;
			
			delegate.LoadServiceType(model.LoggedInUserSessionID ,LE.followupDataControlTypeID , model.LoggedInUserSelectedBranchId, LE.searchTerm);
		}
		
		public function result(rpcEvent : Object):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection  =new ArrayCollection();
			
			var ResultXml:XML = rpcEvent.result as XML
			
			var FollowUpServiceTypesList:XMLList = ResultXml.ResponseData.ServiceTypeDTO;
			
			for(var i:int = 0 ; i < FollowUpServiceTypesList.length(); i++ )
			{
				var ct:FollowUpServiceTypeDTO = new FollowUpServiceTypeDTO();
				ct.FromXML( FollowUpServiceTypesList[i] );
				Types.addItem( ct );
			}
			
			if (followUpDataControlTypeID == 1)
			{
				model.followUpServiceTypeList = Types;
			}
			else if (followUpDataControlTypeID == 2)
			{
				model.followUpServiceDateList = Types;
			}
			
			trace( "model updated "  )
			
			trace( "on result found record ",Types.length );
		}
		
		
		
		public function fault(rpcEvent : Object):void
		{			
			var errorStatus:String = "Fault occured in LoadLabTestStaticCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
		
		
		public function LoadFollowUpServiceTypeCommand()
		{
		}
	}
}