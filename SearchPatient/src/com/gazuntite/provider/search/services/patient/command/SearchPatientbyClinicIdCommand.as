package com.gazuntite.provider.search.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.search.services.patient.delegate.SearchPatientbyClinicIdDelegate;
	import com.gazuntite.provider.search.services.patient.dto.SearchPatientResultsList;
	import com.gazuntite.provider.search.services.patient.event.SearchPatientbyClinicIdEvent;
	import com.gazuntite.provider.search.services.patient.model.SearchPatientModelLocator;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class SearchPatientbyClinicIdCommand implements Command
	{
		private var model : SearchPatientModelLocator = SearchPatientModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:SearchPatientbyClinicIdDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new SearchPatientbyClinicIdDelegate( responder );			
		
			var LE:SearchPatientbyClinicIdEvent = cgEvent as SearchPatientbyClinicIdEvent;
			
			callBack = LE.callBack;
			if( LE.pageNo > 0 )
			{
				delegate.SearchPatientList( model.LoggedInUserSelectedBranchId, LE.searchString, LE.pageNo, LE.filterType );
			}
		}
			
		private function onSuccess(event:ResultEvent):void
		{
			var psl:SearchPatientResultsList = new SearchPatientResultsList();
			psl.FromXML( event.result as XML );
			
			model.SearchPatientResults = psl;
			
			if( null != callBack )
				callBack();
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Received In SearchPatientbyClinicIdCommand.\n";
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString() +"\n" + event.fault.faultString, model.LoggedInUserId); 
		}
	}
}