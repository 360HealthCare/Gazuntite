package com.gazuntite.services.commands.chronicMedication
{
	import com.gazuntite.events.chronicMedication.GetStrengthEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.allergy.AllergyClassTypeDTO;
	import com.gazuntite.services.valueObjects.chronicMedication.FormTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetStrengthCommand
	{
		[Inject(id="getStrengthService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetStrengthEvent):AsyncToken
		{
			trace("getStrengthService::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::Strengths.Strength;
			
			//trace(xml);
			//trace("result");
			
			sharedModel.MedicationStrengthList = new ArrayCollection([]);
			
			var i:FormTypeDTO;
			for each(var x:XML in xml)
			{
				i = new FormTypeDTO();
				i.Code = x.@Code;
				i.Term = x.@Term;
				sharedModel.MedicationStrengthList.addItem(i);
				
				//trace(i.immunizationTypeName);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}