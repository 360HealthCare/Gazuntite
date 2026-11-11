package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadAllStationsByClinicIdDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllStationsByClinicIdEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadAllStationsByClinicIdCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadAllStationsByClinicIdDelegate;
		private var funct:Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllStationsByClinicIdDelegate( responder );			
			
			var LE:LoadAllStationsByClinicIdEvent = cgEvent as LoadAllStationsByClinicIdEvent;
			this.funct = LE.func;
			delegate.LoadAllStationsByClinicId(model.loggedInUserSelectedBranchId);
		}
		private function onSuccess(event:ResultEvent):void
		{
			var xStation:XML = event.result.Stations[0];
			
			var stdata:StaticDataDTO = SchedulerModelLocator.getInstance().StaticData;
			stdata.FromXML( xStation );
			
			if(this.funct != null)
				this.funct();
			
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(),"LoadAllStationsByClinicIdCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}