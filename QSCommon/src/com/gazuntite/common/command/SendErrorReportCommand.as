package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.SendErrorReportDelegate;
	import com.gazuntite.common.event.SendErrorReportEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class SendErrorReportCommand implements Command
	{
		private var responder : Responder;
		private var delegate : SendErrorReportDelegate;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new SendErrorReportDelegate(responder);
			
			//var EV:GetEmailEvent = cgEvent as GetEmailEvent;
			//delegate.GetEmailList(EV.clinicBranchid,EV.userId,EV.stationId);
			
			var SER:SendErrorReportEvent = cgEvent as SendErrorReportEvent;
			callBack = SER.callBack;
			delegate.SendErrorReport(SER.objErrorReportDTO);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			trace(event.result);
			var result:String = event.result.toString();
			
			//Alert.show("Email sent successfully.");
			Alert.show("Report has been sent to Support.","Info",4,FlexGlobals.topLevelApplication.mainContainer);
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Unable to Send Error Information to Support.","Info",4,FlexGlobals.topLevelApplication.mainContainer);
		}
		
	}
}