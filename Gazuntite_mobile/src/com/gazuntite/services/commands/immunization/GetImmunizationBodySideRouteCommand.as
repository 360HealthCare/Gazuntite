package com.gazuntite.services.commands.immunization
{
	import com.gazuntite.events.immunization.GetImmunizationBodySideRouteEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationBodySideRouteDTO;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetImmunizationBodySideRouteCommand
	{
		[Inject(id="getImmunizationBodySideRouteService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetImmunizationBodySideRouteEvent):AsyncToken
		{
			trace("GetImmunizationBodySideRoute::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace("GetImmunizationBodySideRoute::result",event.result);
			
			var xml:XMLList = XML(event.result).*::AutoCompleteList.*::string;
			sharedModel.ImmunizationBodySideRouteDTOList = new ArrayCollection();
			var i:ImmunizationBodySideRouteDTO;
			for each(var x:XML in xml)
			{
				i = new ImmunizationBodySideRouteDTO();
				i.Name = x;
				trace( i.Name );
				sharedModel.ImmunizationBodySideRouteDTOList.addItem( i );
				
				//trace(i.immunizationTypeName);
			}
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace("GetImmunizationBodySideRoute::fault",fault.message.toString());
		}
	}
}