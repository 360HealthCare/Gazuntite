package com.gazuntite.patient.visit.command.physical.physical
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.physical.ManagePatientPhysicalDelegate;
	import com.gazuntite.patient.visit.dto.PhysicalDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientPhysicalCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:CairngormEvent;
		
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:ManagePatientPhysicalDelegate = new  ManagePatientPhysicalDelegate(this);
				
				LE = event as CairngormEvent;
				var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
				var dtoList:ArrayCollection = getDTOList(model.physicalDTOList);
				if( dtoList.length > 0 )
					delegate.ManagePatientPhysical(dtoList, model.LoggedInUserId, model.VisitID, model.patientID, actionDate, model.LoggedInUserSessionID);
			}
		}
		
		private function getDTOList(list:ArrayCollection):ArrayCollection
		{
			var retList:ArrayCollection = new ArrayCollection();
			
			for each( var dto:PhysicalDTO in list )
			{
				if( dto.IsDirty )
				{
					if( dto.children && dto.children.length > 0 )
					{
						retList.addAll( getDTOList( dto.children ) );
					}
					else
					{
						dto.ModifiedAt 		= new Date();
						dto.ModifiedBy 		= model.LoggedInUserId;
						dto.VisitID    		= model.VisitID;
						dto.PatientID   	= model.patientDTO.ID;
						dto.CreatedBy    	= model.LoggedInUserId;
						retList.addItem( dto );
					}
				}
			}
			
			return retList;
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					UtilityFunctions.ShowMessage( "Physical Saved.", "Info" );
				}
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientPhysicalCommand \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in ManagePatientPhysicalCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}