package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.LoadAllUserTypeDelegate;
	import com.gazuntite.common.event.LoadAllUserTypeEvent;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	
	import flash.display.Sprite;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadAllUserTypeCommand implements Command
	{
		private var responder:Responder;
		private var delegate:LoadAllUserTypeDelegate;		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllUserTypeDelegate( responder );			
			
			var LE:LoadAllUserTypeEvent = cgEvent as LoadAllUserTypeEvent;
			
			callBack = LE.callBack;
			
			delegate.GetUserTypeList();
			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
									
			callBack(event.result as XML);			
						
		}
		
		private function onError(event:FaultEvent):void
		{
			//Alert.show("Received In LoadAllUserTypeCommand.\n" + event.toString(), QSConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
			QSCombinedExceptionAlert.getInstance().Show( "Error in LoadAllUserTypeCommand", event.toString(), 0); 
		}
	}
}