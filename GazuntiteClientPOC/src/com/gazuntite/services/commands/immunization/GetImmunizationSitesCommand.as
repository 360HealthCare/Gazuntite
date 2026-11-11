package com.gazuntite.services.commands.immunization
{
	import com.gazuntite.events.immunization.GetImmunizationSitesEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationSiteDTO;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetImmunizationSitesCommand
	{
		[Inject(id="getImmunizationSitesService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetImmunizationSitesEvent):AsyncToken
		{
			trace("GetImmunizationSitesCommand::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace(event.result);
			var xml:XMLList = XML(event.result).*::AutoCompleteList.*::string;
			sharedModel.ImmunizationSitesDTOList = new ArrayCollection();
			var i:ImmunizationSiteDTO;
			for each(var x:XML in xml)
			{
				i = new ImmunizationSiteDTO();
				i.Name = x;
				trace( i.Name );
				sharedModel.ImmunizationSitesDTOList.addItem( i );
				
				//trace(i.immunizationTypeName);
			}	
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace(fault.message.toString());
		}
	}
}