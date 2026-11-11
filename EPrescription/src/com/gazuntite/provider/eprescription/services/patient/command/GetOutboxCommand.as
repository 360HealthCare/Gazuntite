package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetOutboxDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetOutboxEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetOutboxCommand  implements Command 
	{
		
		private var responder:Responder;
		private var delegate:GetOutboxDelegate;
		private var LE:GetOutboxEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			
			responder = new Responder(result, fault);				
			delegate  = new GetOutboxDelegate( responder );			
			
			var LE:GetOutboxEvent = cgEvent as GetOutboxEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetOutbox(LE.SPI, LE.data);
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
			Alert.show("Fault occured in GetOutboxCommand.\n"+rpcEvent.toString(),'info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}