package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetDenialCodesDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetDenialCodesEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetDenialCodesCommand  implements Command {
		
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:GetDenialCodesDelegate;
		private var LE:GetDenialCodesEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void {
			
			responder = new Responder(result, fault);				
			delegate  = new GetDenialCodesDelegate( responder );			
			
			var LE:GetDenialCodesEvent = cgEvent as GetDenialCodesEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetCodes( LE.data);
		}
		
		
		public function result( rpcEvent : ResultEvent ) : void {										
			if( null != callBack )
			{
				callBack(new XML(rpcEvent.message.body.toString()));
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in GetDenialCodesCommand.\n"+rpcEvent.toString(),'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}