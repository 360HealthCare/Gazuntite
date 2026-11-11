package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.SearchDrugbyGNameDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.SearchDrugbyGNameEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class SearchDrugbyGNameCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:SearchDrugbyGNameDelegate;
		private var LE:SearchDrugbyGNameEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void
		{
			responder = new Responder(result, fault);				
			delegate  = new SearchDrugbyGNameDelegate( responder );			
			
			var LE:SearchDrugbyGNameEvent = cgEvent as SearchDrugbyGNameEvent;
			
			callBack = LE.resultHandlerFunction;
			
			delegate.GetMedicineList(LE.data, LE.drugName, LE.startno, LE.tradeName, LE.ndc);
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
			Alert.show("Fault occured in SearchDrugbyGNameCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}