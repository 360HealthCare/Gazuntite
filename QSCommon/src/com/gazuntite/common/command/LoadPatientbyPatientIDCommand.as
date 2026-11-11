package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.LoadPatientbyPatientIDDelegate;
	import com.gazuntite.common.dto.PatientDTO;
	import com.gazuntite.common.dto.SearchPatientResultsList;
	import com.gazuntite.common.event.LoadPatientbyPatientIDEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
	 * Author : TA
	 * */
	
	public class LoadPatientbyPatientIDCommand implements Command
	{
		private var responder : Responder;
		private var delegate : LoadPatientbyPatientIDDelegate;
		private var callBack			: Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);
			delegate = new LoadPatientbyPatientIDDelegate(responder);
			
			var lp:LoadPatientbyPatientIDEvent = event as LoadPatientbyPatientIDEvent;
			callBack = lp.callBack;
			delegate.LoadPatientbyPatientID(lp.patientID);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var psl:SearchPatientResultsList = new SearchPatientResultsList();
			psl.FromXML( event.result as XML );
			
			if(psl.Patients != null)
			{
				var patientDTO:PatientDTO = psl.Patients.getItemAt(0) as PatientDTO;
				
				if(this.callBack != null)
				{
					this.callBack(patientDTO);
				}
			}
		}
		
		private function onError(event:FaultEvent):void
		{
			//Alert.show("Error in LoadPatientbyPatientIDCommand.", "Info", 4, FlexGlobals.topLevelApplication.mainContainer);
			QSCombinedExceptionAlert.getInstance().Show( "Error in LoadPatientbyPatientIDCommand", event.toString(), 0); 
		}
	}
}