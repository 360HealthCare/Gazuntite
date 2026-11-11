package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.GetMedicationsDelegate;
	import com.gazuntite.provider.eprescription.services.patient.dto.MedicationRequestDTO;
	import com.gazuntite.provider.eprescription.services.patient.dto.MedicineDTO;
	import com.gazuntite.provider.eprescription.services.patient.event.GetMedicationsEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetMedicationsCommand  implements Command
	{
		
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:GetMedicationsDelegate;
		private var RequestedMedicineDTO:MedicationRequestDTO;
		private var LE:GetMedicationsEvent;
		private var CallBackFun:Function;
		public function GetMedicationsCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			
			responder = new Responder(result, fault);				
			delegate  = new GetMedicationsDelegate( responder );			
			
			LE = cgEvent as GetMedicationsEvent;
			RequestedMedicineDTO = LE.MedicineDTO;
			CallBackFun = LE.callback;		
			
			CursorManager.setBusyCursor();
			
			delegate.GetMedicine(RequestedMedicineDTO);
		}
		
		
		public function result( rpcEvent : ResultEvent ) : void 
		{										
			
			var medicationResponse:XML = new XML(rpcEvent.message.body.toString());
			
			if(null != medicationResponse)
			{
				if(null != model.medicineResults)
					model.medicineResults.removeAll();
				else
					model.medicineResults = new ArrayCollection();
				
				var xMedications : XMLList = medicationResponse.Strengths.Strength;
				
				
				for(var i:int = 0 ; i < xMedications.length() ; i++)
				{
					var medication:MedicineDTO = new MedicineDTO();
					medication.FromXml(xMedications[i]);
					model.medicineResults.addItem(medication);
				}
				
				CursorManager.removeBusyCursor();
				
				if(null != CallBackFun)
					CallBackFun();
				
			}
			
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in GetMedicineCommand.\n"+rpcEvent.toString(),'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
			CursorManager.removeBusyCursor();
		}
	}
}