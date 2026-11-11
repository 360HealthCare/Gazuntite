package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.DeletePatientMedDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.DeletePatientMedEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class DeletePatientMedCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:DeletePatientMedDelegate;
		private var LE:DeletePatientMedEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new DeletePatientMedDelegate( responder );			
			
			var LE:DeletePatientMedEvent = cgEvent as DeletePatientMedEvent;
			CursorManager.setBusyCursor();
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.RemovePatientMed(LE.referenceNumber, LE.data);
		}
		
		
		public function result( rpcEvent : ResultEvent ) : void 
		{										
			if( null != callBack )
			{
				callBack(new XML(rpcEvent.message.body.toString()));
			}
			CursorManager.removeBusyCursor();
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in DeletePatientMedCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
			CursorManager.removeBusyCursor();
		}
	}
}