package com.gazuntite.services.commands
{
	import com.gazuntite.events.GetAllergyClassTypesEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.AllergyClassTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetAllergiesClassesType
	{
		[Inject(id="getAllergyTypesService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetAllergyClassTypesEvent):AsyncToken
		{
			trace("GetAllergiesClassesType::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::AllergyClass.*::AllergyClass;
			
			//trace(xml);
			//trace("result");
			
			sharedModel.AllergyClassTypes = new ArrayCollection([]);
			
			var i:AllergyClassTypeDTO;
			for each(var x:XML in xml)
			{
				i = new AllergyClassTypeDTO();
				i.ClassTypeId = x.*::ALLERGY_CLASS_ID;
				i.ClassTypeName = x.*::DISPLAY_NAME;
				sharedModel.AllergyClassTypes.addItem(i);
				
				//trace(i.immunizationTypeName);
			}	
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}
