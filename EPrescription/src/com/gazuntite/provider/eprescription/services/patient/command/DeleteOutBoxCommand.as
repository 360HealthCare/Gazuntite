package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;	
	import com.gazuntite.provider.eprescription.services.patient.delegate.DeleteOutBoxDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.DeleteOutBoxEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class DeleteOutBoxCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:DeleteOutBoxDelegate;
		private var LE:DeleteOutBoxEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new DeleteOutBoxDelegate( responder );			
			
			var LE:DeleteOutBoxEvent = cgEvent as DeleteOutBoxEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.RemoveOutbox(LE.referenceNumber, LE.data);
		}
		
		public function result( rpcEvent : ResultEvent ) : void
		{										
			if( null != callBack )
			{
				callBack(new XML(rpcEvent.message.body.toString()));
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in DeleteOutBoxCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}