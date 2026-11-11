package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.ManageAppointmentRequestDelegate;
	import com.gazuntite.provider.live.services.scheduler.event.ManageAppointmentRequestEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ManageAppointmentRequestCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:ManageAppointmentRequestDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new ManageAppointmentRequestDelegate( responder );			
			
			var LE:ManageAppointmentRequestEvent = cgEvent as ManageAppointmentRequestEvent;
			this.functionName = LE.functionName;
			
			delegate.ManageAppointmentRequest(LE.requestId, LE.statusId, LE.modifiedBy, LE.modifiedAt, LE.reqStatus, LE.clinicBranchId, LE.rejectionReason);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			if(this.functionName != null)
			{
				this.functionName();
			}
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), 'ManageAppointmentRequestCommand' , 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}