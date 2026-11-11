package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetNDCByDRUGIDProductIDDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.GetNDCByDRUGIDProductIDEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	/**
	 * @ Author - TA
	 * Zigron Inc
	 **/
	
	public class GetNDCByDRUGIDProductIDCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetNDCByDRUGIDProductIDDelegate;
		private var LE:GetNDCByDRUGIDProductIDEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new GetNDCByDRUGIDProductIDDelegate( responder );			
			
			LE = cgEvent as GetNDCByDRUGIDProductIDEvent;
			
			callBack = LE.resultHandlerFunction;
			var d:Date = new Date();
			delegate.GetMedicineList(LE.data, LE.strengthID, LE.productId, LE.ndc, LE.drugId );
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
			Alert.show("Fault occured in MedicineNDCSearchCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}