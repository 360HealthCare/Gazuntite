package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.live.services.elab.delegate.ProcessLabOrderDelegate;
	import com.gazuntite.provider.live.services.elab.event.ProcessLabOrderEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ProcessLabOrderCommand implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:ProcessLabOrderDelegate;
		private var LE:ProcessLabOrderEvent;
		private var func:Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new ProcessLabOrderDelegate(responder);			
			
			LE = event as ProcessLabOrderEvent;
			this.func = LE.func;
			delegate.ProcessLabOrder(LE.dataXML, LE.date);
		}
		
		private function onSuccess(event:ResultEvent):void
		{	
			if (this.func != null)
			{
				this.func ();
			}
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in ProcessLabOrderCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), model.LoggedInUserId ); 
		}
	}
}