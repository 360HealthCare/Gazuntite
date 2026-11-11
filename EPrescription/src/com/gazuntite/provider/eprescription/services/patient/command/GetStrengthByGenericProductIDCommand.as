package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetStrengthByGenericProductIDDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetStrengthByGenericProductIDEvent;
	import com.gazuntite.provider.eprescription.services.patient.event.SearchDrugbyGNameEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetStrengthByGenericProductIDCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetStrengthByGenericProductIDDelegate;
		private var LE:GetStrengthByGenericProductIDEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new GetStrengthByGenericProductIDDelegate( responder );			
			
			var LE:GetStrengthByGenericProductIDEvent = cgEvent as GetStrengthByGenericProductIDEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetStrength(LE.data, LE.prodName, LE.ndc);
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
			Alert.show("Fault occured in GetMedicineStrengthCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}