package com.gazuntite.services.commands.icd
{
	import com.gazuntite.events.icd.GetICDCodeDescriptionEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.icd.ICDCodeDTO;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetICDCodeDescriptionCommand
	{
		[Inject(id="getICDCodeDescriptionService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetICDCodeDescriptionEvent):AsyncToken
		{
			trace("getICDCodeDescriptionService sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = event.result.children();
			
			//trace(xml);
			//trace("result");
			
			sharedModel.ICDCodeDTOList = new ArrayCollection([]);
			
			var i:ICDCodeDTO;
			for each(var x:XML in xml)
			{
				i = new ICDCodeDTO();
				i.Code = x.*::IcdCodeName;
				i.Description = x.*::IcdCodeDescription;
				sharedModel.ICDCodeDTOList.addItem(i);
				
				//trace(i.immunizationTypeName);
			}	
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}
