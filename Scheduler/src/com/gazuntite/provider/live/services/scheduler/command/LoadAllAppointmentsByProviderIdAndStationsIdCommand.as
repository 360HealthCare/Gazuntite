package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadAllAppointmentsByProviderIdAndStationsIdDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.AppointmentDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllAppointmentsEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadAllAppointmentsByProviderIdAndStationsIdCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		private var responder:Responder;
		public var functionName : Function;
		public var isFilterd:Boolean = false;
		
		private var delegate:LoadAllAppointmentsByProviderIdAndStationsIdDelegate;
				
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllAppointmentsByProviderIdAndStationsIdDelegate( responder );			
			
			var LE:LoadAllAppointmentsEvent = cgEvent as LoadAllAppointmentsEvent;
			this.functionName = LE.functionName;
			if(LE.isFiltered)
				isFilterd = true;
			delegate.LoadAllAppointmentsByProviderIdAndStationsId(LE.providerID, LE.StationId, LE.isAllProviderSelected, LE.isAllLocationSelected, LE.viewTypeID);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var xLocations:XML = event.result.Locations[0];
			model.totalRecords_AllApp = event.result.Paging.@['Total'];
			model.ScheduledAppointmentList = new ArrayCollection();
			model.AllAppointmentList = new ArrayCollection();
			
			if(xLocations.Location.length() >0)
			{
				for(var i:uint=0; i < xLocations.Location.length(); i++)
				{
					var aLocation:XML = xLocations.Location[i];
					if(aLocation.Providers.Provider.length() > 0)
					{
						for(var j:uint=0; j < aLocation.Providers.Provider.length(); j++)
						{
							var aProvider:XML = aLocation.Providers.Provider[j];
							if(aProvider.Appointments.Appointment.length() > 0)
							{
								for(var k:uint = 0; k < aProvider.Appointments.Appointment.length(); k++)
								{
									var aAppointmentDTO:AppointmentDTO = new AppointmentDTO();
									var aAppointment:XML = aProvider.Appointments.Appointment[k];
									aAppointmentDTO.FromXML(aAppointment, aProvider);
									model.ScheduledAppointmentList.addItem(aAppointmentDTO);
									model.AllAppointmentList.addItem(aAppointmentDTO);
									//trace(aAppointment.toXMLString());
								}
							}
						}
					}
					
				}
			}
			
			if(this.functionName != null)
			{
				this.functionName();
			}
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(),"LoadAllAppointmentsByProviderIdAndStationsIdCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}