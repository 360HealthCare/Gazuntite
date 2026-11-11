package com.gazuntite.services.commands.chronicMedication
{
	import com.gazuntite.events.chronicMedication.GetMedicationFormDataEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.allergy.AllergyClassTypeDTO;
	import com.gazuntite.services.valueObjects.chronicMedication.FormTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class getMedicationFormDataCommand
	{
		[Inject(id="getMedicationFormDataService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetMedicationFormDataEvent):AsyncToken
		{
			trace("getMedicationFormDataService::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::DosageForms.Form;
			
			sharedModel.MedicationDosageFormList = new ArrayCollection([]);
			
			var i:FormTypeDTO;
			for each(var x:XML in xml)
			{
				i = new FormTypeDTO();
				i.Code = x.@Code;
				i.Term = x.@Term;
				sharedModel.MedicationDosageFormList.addItem(i);
			}
			
			trace(">>> MedicationDosageFormList.length", sharedModel.MedicationDosageFormList.length);
			
			sharedModel.MedicationQuantityFormList = new ArrayCollection([]);
			xml = XML(event.result).*::QuantityForms.Form;
			
			//var i:FormTypeDTO;
			for each(x in xml)
			{
				i = new FormTypeDTO();
				i.Code = x.@Code;
				i.Term = x.@Term;
				sharedModel.MedicationQuantityFormList.addItem(i);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}