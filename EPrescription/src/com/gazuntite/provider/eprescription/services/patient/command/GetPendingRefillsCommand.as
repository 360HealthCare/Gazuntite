package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetPendingRefillsDelegate;
	import com.gazuntite.provider.eprescription.services.patient.dto.PendingRefillRequestDTO;
	import com.gazuntite.provider.eprescription.services.patient.event.GetPendingRefillsEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetPendingRefillsCommand  implements Command 
	{
		[Bindable]
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:GetPendingRefillsDelegate;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new GetPendingRefillsDelegate( responder );			
			
			var LE:GetPendingRefillsEvent = cgEvent as GetPendingRefillsEvent;
			
			var d:Date = new Date();
			delegate.GetPendingRefills(LE.data);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			//TA - 27 Sep, 2012 - convert all data into proper DTO
			var resultXML:XML = new XML(rpcEvent.message.body.toString());
			
			if(null != resultXML)
			{
				if(null != model.PendingRequestList)
					model.PendingRequestList.removeAll();
				
				model.PendingRequestList = new ArrayCollection();
				
				for(var i:int=0; i<resultXML.LoadPendingReq.length(); i++)
				{
					var pendingRefillDTO:PendingRefillRequestDTO = new PendingRefillRequestDTO();
					pendingRefillDTO.FromXML(resultXML.LoadPendingReq[i]);
					model.PendingRequestList.addItem(pendingRefillDTO);
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in GetPendingRefillsCommand.\n"+rpcEvent.toString(),'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}