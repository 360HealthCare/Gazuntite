package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadAllAppointmentTypesDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllAppointmentTypesEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadAllAppointmentTypesCommand implements Command
	{
			
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadAllAppointmentTypesDelegate;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllAppointmentTypesDelegate( responder );			
			
			var LE:LoadAllAppointmentTypesEvent = cgEvent as LoadAllAppointmentTypesEvent;
			
			delegate.LoadAllAppointmentTypes();
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var xTypes:XML = event.result.Types[0];
			
			var stdata:StaticDataDTO = SchedulerModelLocator.getInstance().StaticData;
			stdata.FromXML( xTypes);
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), "LoadAllAppointmentTypesCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}