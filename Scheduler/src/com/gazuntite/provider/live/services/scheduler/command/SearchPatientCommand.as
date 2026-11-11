package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.SearchPatientDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.SearchPatientDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.event.SearchPatientEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class SearchPatientCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:SearchPatientDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new SearchPatientDelegate( responder );			
			
			var LE:SearchPatientEvent = cgEvent as SearchPatientEvent;
			this.functionName = LE.functionName;
			
			if(LE.searchString!=null && LE.searchString.length>0)
			{
				delegate.SearchPatientbyClinicIdAndSearchString(LE.clinicBranchId, LE.providerId, LE.userTypeId, LE.searchString, LE.pageNo);
			}
		}
		private function onSuccess(event:ResultEvent):void
		{
			var xPatients:XML = event.result.Patients[0];
			var xSearchPtientByClinicList:XMLList = xPatients.Patient;
			model.SearchPatientsList	= new ArrayCollection();
			
			for( var q:int = 0; q < xSearchPtientByClinicList.length(); q++ )
			{
				var aSearchPtientDTO:SearchPatientDTO = new SearchPatientDTO();
				aSearchPtientDTO.FromXML( xSearchPtientByClinicList[q] );
				model.SearchPatientsList.addItem( aSearchPtientDTO );
			}
			if(this.functionName != null)
			{
				this.functionName(model.SearchPatientsList);
			}
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), "SearchPatientbyClinicIdAndSearchStringCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}