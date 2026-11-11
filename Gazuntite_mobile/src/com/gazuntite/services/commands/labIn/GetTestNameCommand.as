package com.gazuntite.services.commands.labIn
{
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
	
	public class GetTestNameCommand
	{
		[Inject(id="getTestNameService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetTestNameEvent):AsyncToken
		{
			trace("getTestNameService::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::Tests.Test;
			
			//trace(xml);
			//trace("result");
			
			sharedModel.LabInTestNameList = new ArrayCollection([]);
			
			//var i:Object;
			for each(var x:XML in xml)
			{
				//i = new FormTypeDTO();
				var i:Object = new Object();
				
				i.testCode = x.@testCode;
				i.testName = x.@testName;
				sharedModel.LabInTestNameList.addItem(i);
				
				trace(i.testName);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}