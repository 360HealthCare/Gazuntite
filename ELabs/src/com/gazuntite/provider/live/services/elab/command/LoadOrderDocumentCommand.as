package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.live.services.elab.delegate.LoadOrderDocumentDelegate;
	import com.gazuntite.provider.live.services.elab.event.LoadOrderDocumentEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadOrderDocumentCommand implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadOrderDocumentDelegate;
		private var callBack:Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadOrderDocumentDelegate( responder );			
			
			var LE:LoadOrderDocumentEvent = cgEvent as LoadOrderDocumentEvent;
			this.callBack = LE.callBack;
			
			if( LE.OrderID > 0 )
			{
				delegate.LoadOrderDocument( LE.OrderID, LE.docType );
			}
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var result:XML = event.result as XML;
			var DocUrl:String = result.@["DocUrl"];
			if( DocUrl.length > 5 ) //must be something, its not a url if less than 'n' chars
			{
				callBack( DocUrl );
			} 
			else if( result.hasOwnProperty( "Status" ) && result.Status.@Type == "Error" )
			{
				Alert.show( result.Status.@Message, "Status Message", Alert.OK, FlexGlobals.topLevelApplication.mainContainer  );
			}
			
			trace( event.result );
		}
		
		private function onError(event:FaultEvent):void
		{
			//Alert.show("Received In LoadOrderDocumentCommand.\n" + event.toString(), ELabsConstant.ERROR, Alert.OK, FlexGlobals.topLevelApplication.mainContainer );
			
			var errorStatus:String = "Fault occured in LoadOrderDocumentCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), model.LoggedInUserId ); 
		}
	}
}