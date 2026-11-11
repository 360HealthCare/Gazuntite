package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadPatientCompleteInfoDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.PatientCompleteInfoDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadPatientCompleteInfoEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPatientCompleteInfoCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadPatientCompleteInfoDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadPatientCompleteInfoDelegate( responder );			
			
			var LE:LoadPatientCompleteInfoEvent = cgEvent as LoadPatientCompleteInfoEvent;
			this.functionName = LE.functionName;
			
			delegate.LoadPatientCompleteInfo( LE.patientId, LE.clinicBranchId, LE.providerUserId, LE.stationId);
		}
		private function onSuccess(event:ResultEvent):void
		{
			var xPatientCompleteInfo:XML = event.result.Patient[0];
			
			var obj:PatientCompleteInfoDTO = new PatientCompleteInfoDTO();
			
			obj.FromXML( xPatientCompleteInfo );
			model.SelectedPatient = obj;
			CursorManager.removeBusyCursor();
			
			if(this.functionName != null)
			{
				this.functionName();
			}
			
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show(event.toString(), "LoadPatientCompleteInfoCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
			CursorManager.removeBusyCursor();
		}
	}
}