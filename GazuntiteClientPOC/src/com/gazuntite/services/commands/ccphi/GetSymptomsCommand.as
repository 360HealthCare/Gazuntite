package com.gazuntite.services.commands.ccphi
{
	import com.gazuntite.events.cchpi.GetSymptomsEvent;
	import com.gazuntite.events.chronicMedication.GetMedicineNameEvent;
	import com.gazuntite.events.labIn.GetTestNameEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.allergy.AllergyClassTypeDTO;
	import com.gazuntite.services.valueObjects.chronicMedication.FormTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetSymptomsCommand
	{
		[Inject(id="getSymptomsService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetSymptomsEvent):AsyncToken
		{
			trace("getSymtomService::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::Tests.Test;
			
			//trace(xml);
			//trace("result");
			
			sharedModel.CCHPISymptomList = new ArrayCollection([]);
			
			//var i:Object;
			for each(var x:XML in xml)
			{
				//i = new FormTypeDTO();
				var i:Object = new Object();
				
				i.testCode = x.@testCode;
				i.Symptom = x.@Symptom;
				sharedModel.CCHPISymptomList.addItem(i);
				
				trace(i.Symptom);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}