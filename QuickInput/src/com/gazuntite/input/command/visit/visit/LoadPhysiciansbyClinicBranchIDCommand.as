package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.visit.ListProvidersDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.visit.LoadPhysiciansbyClinicBranchIDDelegate;
	import com.gazuntite.input.event.visit.visit.LoadPhysiciansbyClinicBranchIDEvent;
	import com.gazuntite.input.event.visit.visit.ManageVisitOwnerEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPhysiciansbyClinicBranchIDCommand implements Command
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadPhysiciansbyClinicBranchIDEvent;
		private var responder:Responder;
		private var delegate:LoadPhysiciansbyClinicBranchIDDelegate
		public function execute(event:CairngormEvent):void
		{
			model.VisitProviderSelected 		= -1;
			model.VisitProviderOwnerType 		= -1;
			model.VisitProviderSelectedUserID 	= -1;
			model.VisitProviderOwnerUSerTypeID 	= -1;
			model.VisitProviderName				= '';
			
			responder = new Responder(onSuccess, onError);
			LE = event as LoadPhysiciansbyClinicBranchIDEvent;
			delegate = new  LoadPhysiciansbyClinicBranchIDDelegate(responder);
			
			delegate.LoadPhysiciansbyClinicBranchID( LE.BranchId, LE.VisitID, LE.patientID, LE.isEditMode, LE.UserId);
		}
		
		public function onSuccess(event:ResultEvent):void
		{
			var xProvider:XML = XML(event.result);
			
			if(xProvider.ListProvidersDTO.length() >0)
			{
				var DTOlist:ArrayCollection = new ArrayCollection();
				if( null != model.VisitProviderDTOList)
					model.VisitProviderDTOList.removeAll();
				else
					model.VisitProviderDTOList = new ArrayCollection();
				
				for (var i:int = 0; i < xProvider.ListProvidersDTO.length(); i++) 
				{
					var temp:ListProvidersDTO = new ListProvidersDTO();
					temp.FromXML(xProvider.ListProvidersDTO[i]);
					
					if(temp.isDefault != null && temp.isDefault.toLowerCase() == 'true')
					{
						model.VisitProviderSelected 						= i;
						model.VisitProviderName 							= temp.FirstName +' '+ temp.MiddleName +' '+ temp.LastName;
						model.VisitProviderOwnerType 						= int(temp.UserTypeID);//1- primary, 2-atending, 3- consulting
						model.VisitProviderSelectedUserID 					= int(temp.UserId);
						
						model.VisitProviderOwnerUSerTypeID 					= int(temp.UserTypeID);
					}
					
					model.VisitProviderDTOList.addItem(temp);
				}
				
				if(model.VisitProviderSelected != -1 )
				{
					if( model.VisitProviderOwnerType != 1 && model.VisitProviderOwnerType != 2 && model.VisitProviderOwnerType != 3)
						model.VisitProviderOwnerType = 1;
					
					var gueEvent : ManageVisitOwnerEvent = new ManageVisitOwnerEvent(model.VisitProviderSelectedUserID.toString(), 
						model.VisitProviderOwnerUSerTypeID.toString(), model.VisitProviderOwnerType.toString(), model.VisitID.toString(), model.LoggedInUserId.toString(), null);
					CairngormEventDispatcher.getInstance().dispatchEvent( gueEvent );
				}
			}
			
		}
		
		public function onError(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadPhysiciansbyClinicBranchIDCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}