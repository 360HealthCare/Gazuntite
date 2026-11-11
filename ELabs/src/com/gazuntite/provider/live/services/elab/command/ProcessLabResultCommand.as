package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.live.services.elab.delegate.ProcessLabResultDelegate;
	import com.gazuntite.provider.live.services.elab.event.ProcessLabResultEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	
	public class ProcessLabResultCommand implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:ProcessLabResultDelegate;
		private var LE:ProcessLabResultEvent;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new ProcessLabResultDelegate( responder );			
			
			LE = event as ProcessLabResultEvent;
			
			delegate.ProcessLabResult( LE.dataXML , LE.date );
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			trace( event.result );
		}
		
		private function onError(event:FaultEvent):void
		{
			//Alert.show("Received In ProcessLabResultCommand.\n" + event.toString(), ELabsConstant.ERROR, 4, FlexGlobals.topLevelApplication.mainContainer );
			
			var errorStatus:String = "Fault occured in ProcessLabResultCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), model.LoggedInUserId ); 
		}
	}
}