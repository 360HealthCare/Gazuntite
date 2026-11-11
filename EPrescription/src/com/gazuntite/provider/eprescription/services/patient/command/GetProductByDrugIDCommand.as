package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetProductByDrugIDDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetProductByDrugIDEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetProductByDrugIDCommand  implements Command 
	{
		
		
		private var responder:Responder;
		private var delegate:GetProductByDrugIDDelegate;
		private var LE:GetProductByDrugIDEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			
			responder = new Responder(result, fault);				
			delegate  = new GetProductByDrugIDDelegate( responder );			
			
			var LE:GetProductByDrugIDEvent = cgEvent as GetProductByDrugIDEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.GetMedicineList(LE.data, LE.drugId, LE.tradeName, LE.ndc );
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
			Alert.show("Fault occured in GetProductByDrugIDCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}