package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.visit.CreateVisitDelegate;
	import com.gazuntite.input.event.visit.visit.CreateVisitEvent;
	import com.gazuntite.input.event.visit.visit.LoadPhysiciansbyClinicBranchIDEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class CreateVisitCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:CreateVisitEvent;
		private var func:Function;
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				LE 								 	= event as CreateVisitEvent;
				this.func 							= LE.func;
				var delegate:CreateVisitDelegate 	= new  CreateVisitDelegate(this);
				delegate.CreateVisit( model.LoggedInUserProviderId, model.LoggedInUserSessionID, LE.visitDTO);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				if(re.result!=null)
				{
					trace(re.result.toXMLString());
					
					if(re.result.@Status=="true")
					{
						var xml:XML = re.result as XML;
						//var typeList:ArrayCollection
						if(xml!=null)
						{
							model.VisitID 		= re.result.@ResponseData;
							model.EncounterID 	= re.result.@ResponseData;
							trace("visit created with id :" + model.VisitID)
							//TA --  Load visit physician's list //{ClinicBranchID}/{VisitID}/{PatientID}/{isEditMode}/{loggedinUserID}
							var lPbyCIDEvent:LoadPhysiciansbyClinicBranchIDEvent = new LoadPhysiciansbyClinicBranchIDEvent(model.LoggedInUserSelectedBranchId, model.VisitID, model.patientDTO.ID, 'false', model.LoggedInUserId);
							CairngormEventDispatcher.getInstance().dispatchEvent( lPbyCIDEvent );
							if(func != null)
								func();
						}
					}
					else
					{
						UtilityFunctions.ShowMessage("CreateVisitCommand \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("CreateVisitCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in CreateVisitCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}