package com.gazuntite.services.commands.immunization
{
	import com.gazuntite.events.GetImmunizationTypesEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetImmuniationTypesCommand
	{
		[Inject(id="getImmunizationTypesService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetImmunizationTypesEvent):AsyncToken
		{
			trace("Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::ImmunzationTypeList.*::ImmunizationTypeDTO;
			
			//trace(xml);
			//trace("result");
			
			sharedModel.immunizationTypes = new ArrayCollection([]);
			
			var i:ImmunizationTypeDTO;
			for each(var x:XML in xml)
			{
				i = new ImmunizationTypeDTO();
				i.immunizationTypeId = x.*::ImmunizationTypeId;
				i.immunizationTypeName = x.*::ImmunizationTypeName;
				sharedModel.immunizationTypes.addItem(i);
				
				//trace(i.immunizationTypeName);
			}	
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}