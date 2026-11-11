package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.ManagePatientFavPharmDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.ManagePatientFavPharmEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class ManagePatientFavPharmCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:ManagePatientFavPharmDelegate;
		private var LE:ManagePatientFavPharmEvent;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new ManagePatientFavPharmDelegate( responder );			
			
			var LE:ManagePatientFavPharmEvent = cgEvent as ManagePatientFavPharmEvent;
			
			callBack = LE.functionName;
			
			var d:Date = new Date();
			delegate.managePatientFavPharm(LE.data, d);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			if( null != callBack )
				callBack(new XML(rpcEvent.message.body.toString()) );
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in ManagePatientFavPharmCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}