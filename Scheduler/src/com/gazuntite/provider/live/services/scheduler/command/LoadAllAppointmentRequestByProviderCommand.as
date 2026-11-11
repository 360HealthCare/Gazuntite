package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadAllAppointmentRequestByProviderDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.RequestDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllAppointmentRequestByProviderEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadAllAppointmentRequestByProviderCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadAllAppointmentRequestByProviderDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllAppointmentRequestByProviderDelegate( responder );			
			
			var LE:LoadAllAppointmentRequestByProviderEvent = cgEvent as LoadAllAppointmentRequestByProviderEvent;
			this.functionName = LE.functionName;
			
				delegate.LoadAllAppointmentRequestByProvider(LE.providerId, LE.clinicBranchId);
		}
		private function onSuccess(event:ResultEvent):void
		{
			var xRequests:XML 			= event.result.AppointmentRequestList[0];
			model.totalRecords_PendReq  = event.result.Paging.@['Total'];
			model.RequestList			= new ArrayCollection();
			
			for( var q:int = 0; q < xRequests.Request.length(); q++ )
			{
				var aRequestDTO:RequestDTO = new RequestDTO();
				aRequestDTO.FromXML( xRequests.Request[q] );
				model.RequestList.addItem( aRequestDTO );
			}
			if(this.functionName != null)
			{
				this.functionName();
			}
			CursorManager.removeBusyCursor();
			//trace('Total Request', model.RequestList.length);
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), 'LoadAllAppointmentRequestByProviderCommand' , 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}