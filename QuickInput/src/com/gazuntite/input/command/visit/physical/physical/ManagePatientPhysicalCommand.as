package com.gazuntite.input.command.visit.physical.physical
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.physical.ManagePatientPhysicalDelegate;
	import com.gazuntite.input.event.visit.physical.physical.ManagePatientPhysicalEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientPhysicalCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:ManagePatientPhysicalEvent;
		
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:ManagePatientPhysicalDelegate = new  ManagePatientPhysicalDelegate(this);
				
				LE = event as ManagePatientPhysicalEvent;
				var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
				var dtoList:ArrayCollection
				
				var VisitID:int;
				
				if( LE.IsEditMode )
				{
					setOtherDetails(LE.dto, false)
					VisitID = LE.dto.VisitID;
					dtoList = new ArrayCollection([LE.dto]);
				}
				else
				{
					dtoList = getDTOList( model.physicalDTOList );
					VisitID = model.VisitID;
				}
				
				if( dtoList.length > 0 )
					delegate.ManagePatientPhysical(dtoList, model.LoggedInUserId, VisitID, model.patientID, actionDate, model.LoggedInUserSessionID);
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
						setOtherDetails(dto, true);
						retList.addItem( dto );
					}
				}
			}
			
			return retList;
		}
		
		private function setOtherDetails(dto:PhysicalDTO, addLoadedVisitID:Boolean):void
		{
			dto.ModifiedAt 		= new Date();
			dto.ModifiedBy 		= model.LoggedInUserId;
			
			if( addLoadedVisitID )
				dto.VisitID    		= model.VisitID;
			
			dto.PatientID   	= model.patientDTO.ID;
			dto.CreatedBy    	= model.LoggedInUserId;
			
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					//UtilityFunctions.ShowMessage( "Physical Saved.", "Info" );
					trace( "Physical Saved.", "Info" );
					if( null != LE.callBack )
						LE.callBack();
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