package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.live.services.elab.delegate.ViewResultDelegate;
	import com.gazuntite.provider.live.services.elab.event.ViewResultEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ViewResultCommand  implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:ViewResultDelegate;
		private var LE:ViewResultEvent;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new ViewResultDelegate( responder );			
			
			LE = event as ViewResultEvent;
			
			delegate.LoadResult( LE.OID );
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			trace( event.result );
			//Alert.show( "Result Saved Successfully", "Result Saved", Alert.OK, FlexGlobals.topLevelApplication.mainContainer );
			var statusType:String = event.result.Status.@Type;
			if( statusType.toLowerCase() == "success" )
			{
				if( LE.callBack )
					LE.callBack(event.result.@DocUrl);
			}
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in ViewResultCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), model.LoggedInUserId ); 
			
		}
	}
}