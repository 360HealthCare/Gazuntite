package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.SearchAppointmentsDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.SearchAppointmentsDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.SearchAppointmentsEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class SearchAppointmentsCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:SearchAppointmentsDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new SearchAppointmentsDelegate( responder );			
			
			var LE:SearchAppointmentsEvent = cgEvent as SearchAppointmentsEvent;
			this.functionName = LE.functionName;
			
			if(LE.searchText!=null && LE.searchText.length>0)
			{
				delegate.SearchAppointments(LE.providerUserId, LE.providerId, LE.stationId, LE.fieldTypeId, LE.searchText, LE.pageNo);	
			}
			
		}
		private function onSuccess(event:ResultEvent):void
		{
			var xAppointments:XML = event.result.Appointments[0];
			model.totalRecords_SearchApp = event.result.Paging.@['Total'];
			var xSearchAppointmentsList:XMLList = xAppointments.Appointment;
			model.SearchAppointmentList = new ArrayCollection();
			
			for( var i:int = 0; i < xSearchAppointmentsList.length(); i++ )
			{
				var aSearchAppointmentsList:SearchAppointmentsDTO = new SearchAppointmentsDTO();
				aSearchAppointmentsList.FromXML( xSearchAppointmentsList[i] );
				model.SearchAppointmentList.addItem( aSearchAppointmentsList );
			}
			
			if(this.functionName != null)
			{
				this.functionName(model.SearchAppointmentList);
			}
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show(event.toString(), "SearchAppointmentsCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
			CursorManager.removeBusyCursor();
		}
	}
}