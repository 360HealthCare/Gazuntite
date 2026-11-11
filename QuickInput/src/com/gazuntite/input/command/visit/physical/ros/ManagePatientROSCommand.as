package com.gazuntite.input.command.visit.physical.ros
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ros.ROSDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.ros.ManagePatientROSDelegate;
	import com.gazuntite.input.event.visit.physical.ros.ManagePatientROSEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientROSCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:ManagePatientROSEvent;
		
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:ManagePatientROSDelegate = new  ManagePatientROSDelegate(this);
				
				LE = event as ManagePatientROSEvent;
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
					dtoList = getDTOList( model.rosDTOList );
					VisitID = model.VisitID;
				}

				if( dtoList.length > 0 )
					delegate.ManagePatientRos(dtoList, model.LoggedInUserId, VisitID, model.patientID, actionDate, model.LoggedInUserSessionID);
			}
		}
		
		private function getDTOList(list:ArrayCollection, addLoadedVisitID:Boolean = true):ArrayCollection
		{
			var retList:ArrayCollection = new ArrayCollection();
			
			for each( var dto:ROSDTO in list )
			{
				if( dto.IsDirty )
				{
					if( dto.children && dto.children.length > 0 )
					{
						retList.addAll( getDTOList( dto.children ) );
					}
					else
					{
						setOtherDetails(dto, addLoadedVisitID);
						retList.addItem( dto );
					}
				}
			}
			
			return retList;
		}
		
		private function setOtherDetails(dto:ROSDTO, addLoadedVisitID:Boolean):void
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
					//UtilityFunctions.ShowMessage( "ROS Saved.", "Info" );
					trace( "ROS Saved.", "Info" );
					if( null != LE.callBack )
						LE.callBack();
				}
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientROSCommand \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in ManagePatientROSCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}