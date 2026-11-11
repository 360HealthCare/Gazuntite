package com.gazuntite.services.commands.immunization
{
	import com.gazuntite.events.immunization.GetImmunizationTypesEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationManufacturersDTO;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import com.gazuntite.events.immunization.GetImmunizationManufacturersEvent;

	
	public class GetImmunizationManufacturersCommand
	{
		[Inject(id="getImmunizationManufacturersService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetImmunizationManufacturersEvent):AsyncToken
		{
			trace("GetImmunizationManufacturersCommand::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{ 
			//trace("GetImmunizationManufacturersCommand::result", event.result);
			var xml:XMLList = XML(event.result).*::AutoCompleteList.*::string;
			sharedModel.ImmunizationManufacturersDTOList = new ArrayCollection();
			var i:ImmunizationManufacturersDTO;
			for each(var x:XML in xml)
			{
				i = new ImmunizationManufacturersDTO();
				i.Name = x;
				trace( i.Name );
				sharedModel.ImmunizationManufacturersDTOList.addItem( i );
				
				//trace(i.immunizationTypeName);
			}
		}
		
		public function fault(fault:FaultEvent):void
		{
			trace("GetImmunizationManufacturersCommand::fault", fault.message.toString());
		}
	}
}