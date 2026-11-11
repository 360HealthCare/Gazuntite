package com.gazuntite.services.commands.chronicMedication
{
	import com.gazuntite.events.chronicMedication.GetGenericnameEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.allergy.AllergyClassTypeDTO;
	import com.gazuntite.services.valueObjects.chronicMedication.FormTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetgetGenericnameCommand
	{
		[Inject(id="getGenericnameService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetGenericnameEvent):AsyncToken
		{
			trace("getGenericnameService::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).children();
			
			//trace(xml);
			//trace("result");
			
			sharedModel.MedicationGenericnameList = new ArrayCollection([]);
			
			var i:FormTypeDTO;
			for each(var x:XML in xml)
			{
				i = new FormTypeDTO();
				i.Code = x.@GENPRODUCT_ID;
				i.Term = x.@GenericName;
				sharedModel.MedicationGenericnameList.addItem(i);
				
				//trace(i.immunizationTypeName);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}