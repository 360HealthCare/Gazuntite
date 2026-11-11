package com.gazuntite.patient.visit.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.visit.ManageVisitOwnerDelegate;
	import com.gazuntite.patient.visit.event.visit.ManageVisitOwnerEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ManageVisitOwnerCommand implements Command
	{
		[Bindable] private var model   : QIModelLocator = QIModelLocator.getInstance();
		private var func    :  Function ;
		private var responder:Responder;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);
			var delegate :ManageVisitOwnerDelegate  = new ManageVisitOwnerDelegate (responder);
			var LE:ManageVisitOwnerEvent = cgEvent as ManageVisitOwnerEvent ;
			this.func = LE.functionName;
			
			delegate.ManageVisitOwner(LE.OwnerUserID, LE.OwnerUserTypeID, LE.VisitOwnerTypeID, LE.VisitID, LE.modified_by);
		}
		
		private function  onSuccess(event:ResultEvent): void 
		{
			var result:String = event.result.string;
			if(result.toLowerCase() == 'true')
			{
				if(this.func != null)
				{
					this.func ('true') ;
				}
			}else
			{
				if(this.func != null)
				{
					this.func ('false') ;
				}
			}
		}
		
		private function  onError(event:FaultEvent): void 
		{
			 var errorStatus:String = "Received In ManageVisitOwnerCommand";
			
			 var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			 QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
			
		}
	}
}