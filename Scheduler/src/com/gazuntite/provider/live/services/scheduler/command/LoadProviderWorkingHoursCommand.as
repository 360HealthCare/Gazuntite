package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadProviderWorkingHoursDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.WorkingHoursDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadProviderWorkingHoursEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadProviderWorkingHoursCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadProviderWorkingHoursDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadProviderWorkingHoursDelegate( responder );			
			
			var LE:LoadProviderWorkingHoursEvent = cgEvent as LoadProviderWorkingHoursEvent;
			this.functionName = LE.functionName;
			
			delegate.LoadProviderWorkingHours(LE.providerUserId, LE.providerId, LE.stationId, LE.day);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			model.ProviderWorkingHourList = new ArrayCollection();
			
			var xWorkingHours:XML = event.result.WorkingHours[0];
			var x:XMLList = xWorkingHours.WorkingHour;
			if(x != null && x.length() > 0)
			{
				for( var p:int = 0; p < x.length(); p++ )
				{
					var aProvidersWorkingHoursList:WorkingHoursDTO = new WorkingHoursDTO();
					aProvidersWorkingHoursList.FromXML( x[p] );
					model.ProviderWorkingHourList.addItem( aProvidersWorkingHoursList );
				}
			}
			else
			{
				Alert.show('Selected provider has no working hours set to schedule an appointment, ' + '\n' + 'to book an appointment you have to set working hours for selected provider', "No working hours found" ,4, FlexGlobals.topLevelApplication.mainContainer);
				CursorManager.removeBusyCursor();
				return;
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
			Alert.show(event.toString(), "LoadProviderWorkingHoursCommand" ,4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}