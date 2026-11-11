package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.ManageAppointmentDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.ManageAppointmentEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ManageAppointmentCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:ManageAppointmentDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new ManageAppointmentDelegate( responder );			
			
			var LE:ManageAppointmentEvent = cgEvent as ManageAppointmentEvent;
			this.functionName = LE.functionName;
			
			if(LE.appointmentXML != null )
			{
				delegate.ManageAppointment(LE.appointmentXML, LE.providerId, LE.userTypeId);
			}
		}
		private function onSuccess(event:Event):void
		{
			var strResult:String = event.toString();
			
			if(this.functionName != null)
			{
				this.functionName();
			}
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:IOErrorEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), 'ManageAppointmentCommand', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}