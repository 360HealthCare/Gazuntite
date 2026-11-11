package com.gazuntite.services.commands.immunization
{
	import com.gazuntite.events.immunization.GetImmunizationReasonForRefusalEvent;
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationReasonForRefusalDTO;
	import com.gazuntite.services.valueObjects.immunization.ImmunizationTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetImmunizationReasonForRefusalCommand
	{
		[Inject(id="getImmunizationReasonForRefusalService")]
		public var service:HTTPService;
		
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		public function execute (message:GetImmunizationReasonForRefusalEvent):AsyncToken
		{
			trace("GetImmunizationReasonForRefusalCommand::Service sending...");
			return service.send(); 
		}
		
		
		public function result(event:ResultEvent):void
		{   
			//trace("GetImmunizationReasonForRefusalCommand::result", event.result);
			var xml:XMLList = XML(event.result).*::AutoCompleteList.*::string;
			sharedModel.ImmunizationReasonForRefusalDTOList = new ArrayCollection();
			var i:ImmunizationReasonForRefusalDTO;
			for each(var x:XML in xml)
			{
				i = new ImmunizationReasonForRefusalDTO();
				i.Name = x;
				trace( i.Name );
				sharedModel.ImmunizationReasonForRefusalDTOList.addItem( i );
				
				//trace(i.immunizationTypeName);
			}	
			
		}
		
		
		public function fault(fault:FaultEvent):void
		{
			trace("GetImmunizationReasonForRefusalCommand::fault",fault.message.toString());
		}
	}
}