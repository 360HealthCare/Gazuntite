package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetAddressBookByPartyRegGuidDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetAddressBookByPartyRegGuidEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetAddressBookByPartyRegGuidCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetAddressBookByPartyRegGuidDelegate;
		private var LE:GetAddressBookByPartyRegGuidEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new GetAddressBookByPartyRegGuidDelegate( responder );			
			
			var LE:GetAddressBookByPartyRegGuidEvent = cgEvent as GetAddressBookByPartyRegGuidEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetAddress(LE.rec);
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
			Alert.show("Fault occured in GetAddressBookByPartyRegGuidCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}