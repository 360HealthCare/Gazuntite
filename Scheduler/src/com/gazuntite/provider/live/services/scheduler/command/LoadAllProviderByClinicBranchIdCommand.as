package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadAllProviderByClinicBranchIdDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllProviderByClinicBranchIdEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadAllProviderByClinicBranchIdCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadAllProviderByClinicBranchIdDelegate;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllProviderByClinicBranchIdDelegate( responder );			
			
			var LE:LoadAllProviderByClinicBranchIdEvent = cgEvent as LoadAllProviderByClinicBranchIdEvent;
			
			delegate.LoadAllProviderByClinicBranchId(LE.clinicBranchID, LE.stationId, LE.isLoadAll);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var xTypes:XML = event.result.Providers[0];
			
			var stdata:StaticDataDTO = SchedulerModelLocator.getInstance().StaticData;
			stdata.FromXML( xTypes);
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), "LoadAllProviderByClinicBranchIdCommand.", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}