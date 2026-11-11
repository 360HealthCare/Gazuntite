package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.SearchPharmaciesDelegate;
	import com.gazuntite.provider.eprescription.services.patient.dto.PharmaciesListDTO;
	import com.gazuntite.provider.eprescription.services.patient.event.SearchPharmaciesEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class SearchPharmaciesCommand implements Command
	{
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:SearchPharmaciesDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new SearchPharmaciesDelegate( responder );
			
			var LE:SearchPharmaciesEvent = cgEvent as SearchPharmaciesEvent;
			
			callBack = LE.callBack;
			// SearchPharmacies/{StartNumber}/{NPCID}/{name}/{address}/{zipcode}/{state}/{city}/{phone}/{Fax}/{servicelevel}/{Changelevel}/{Activated}
			delegate.GetPharmacies(LE.pageNo, LE.npcid, LE.Name, LE.address, LE.zipcode, LE.state, LE.city, LE.phone, LE.fax, LE.serviceLevel, LE.changelevel, LE.activated);					
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var psl:PharmaciesListDTO = new PharmaciesListDTO();
			psl.FromXML(  event.result as XML  );
			
			model.PharmacyListDTO =psl;

			if( null != callBack )
				callBack();
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Fault occured in SearchPharmaciesCommand.\n"+event.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}