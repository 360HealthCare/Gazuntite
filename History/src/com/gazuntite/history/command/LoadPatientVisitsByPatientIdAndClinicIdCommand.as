package com.gazuntite.history.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.dto.PatientEncounterDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.history.delegate.LoadPatientVisitsByPatientIdAndClinicIdDelegate;
	import com.gazuntite.history.event.LoadPatientVisitsByPatientIdAndClinicIdEvent;
	import com.gazuntite.history.model.HistoryModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPatientVisitsByPatientIdAndClinicIdCommand implements Command
	{
		[Bindable]
		private var model:HistoryModelLocator = HistoryModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadPatientVisitsByPatientIdAndClinicIdDelegate;
		private var LE:LoadPatientVisitsByPatientIdAndClinicIdEvent;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);		
			delegate = new  LoadPatientVisitsByPatientIdAndClinicIdDelegate(responder);
			
			LE  = cgEvent as LoadPatientVisitsByPatientIdAndClinicIdEvent;
			delegate.LoadPatientVisitsByPatientIdAndClinicId(LE.patientID, LE.clinicBranchId, LE.isShowAll, LE.userID, LE.userTypeID, LE.sessionID);
		}
		
		public function onSuccess(rpcEvent:Object):void
		{
			var re:ResultEvent = rpcEvent as ResultEvent;
			var xml:XMLList = re.result.PatientEncounterList;
			
			/*if(re.result.@TotalRecords != null)
				model.totalRecords_PE 	= re.result.@TotalRecords;
			*/
			if (xml != null)
			{
				var xlist:XMLList = xml.children();
				
				if (xlist != null)
				{
					var DTOlist:ArrayCollection = new ArrayCollection();
					var i:int = 1;
					
					for each (var x:XML in xlist)
					{
						var t:PatientEncounterDTO = new PatientEncounterDTO();
						t.serialNumber = i++;
						t.FromXML(x);
						DTOlist.addItem(t);
					}
					
					model.patientEncounterList = DTOlist;
				}
			}
		}
		
		public function onError(info:Object):void
		{
			var errorStatus:String = "Fault occured in LoadPatientVisitsByPatientIdAndClinicIdCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, info.toString(), userId); 
		}
	}
}