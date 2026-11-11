package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.loadServicelevelsDelegate;
	import com.gazuntite.provider.eprescription.services.patient.dto.ServiceLevelDTO;
	import com.gazuntite.provider.eprescription.services.patient.event.loadServicelevelsEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class loadServicelevelsCommand  implements Command 
	{
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:loadServicelevelsDelegate;
		private var LE:loadServicelevelsEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new loadServicelevelsDelegate( responder );			
			
			var LE:loadServicelevelsEvent = cgEvent as loadServicelevelsEvent;
			
			callBack = LE.resultHandlerFunction;
			
			delegate.GetServiceLevels(LE.data);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			var x1:XML = XML(rpcEvent.message.body.toString());
			
			var psl:ServiceLevelDTO = new ServiceLevelDTO();
			psl.FromXML(  x1  );
			
			model.serviceLevelsDTO = psl;
			//trace( event.result );
			if( null != callBack )
				callBack();
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in loadServicelevelsCommand.\n"+rpcEvent.toString(), 'info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}