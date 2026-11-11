package com.gazuntite.services.commands.immunization
{
	import com.gazuntite.events.immunization.GetImmunizationLotEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationLotDTO;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetImmunizationLotCommand
	{
		[Inject(id="getImmunizationLotService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetImmunizationLotEvent):AsyncToken
		{
			trace("GetImmuniationTypesCommand::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace("GetImmuniationTypesCommand::result",event.result);
			var xml:XMLList = XML(event.result).*::AutoCompleteList.*::string;
			sharedModel.ImmunizationLotDTOList = new ArrayCollection();
			var i:ImmunizationLotDTO;
			for each(var x:XML in xml)
			{
				i = new ImmunizationLotDTO();
				i.Name = x;
				trace( i.Name );
				sharedModel.ImmunizationLotDTOList.addItem( i );
				
				//trace(i.immunizationTypeName);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace("GetImmuniationTypesCommand::fault",fault.message.toString());
		}
	}
}