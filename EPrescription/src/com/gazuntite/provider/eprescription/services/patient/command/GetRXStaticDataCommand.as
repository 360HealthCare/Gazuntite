package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetRXStaticListsDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetRXStaticDataEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetRXStaticDataCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetRXStaticListsDelegate;
		private var LE:GetRXStaticDataEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new GetRXStaticListsDelegate( responder );			
			
			var LE:GetRXStaticDataEvent = cgEvent as GetRXStaticDataEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetStaticLists(LE.data);
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
			Alert.show("Fault occured in GetRXStaticDataCommand.\n"+rpcEvent.toString());
		}
	}
}