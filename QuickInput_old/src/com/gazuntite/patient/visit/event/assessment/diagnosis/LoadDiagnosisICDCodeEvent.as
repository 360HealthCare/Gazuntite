package com.gazuntite.patient.visit.event.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadDiagnosisICDCodeEvent extends CairngormEvent
	{
		public var icdCode:String;
		public var func:Function;
		
		public function LoadDiagnosisICDCodeEvent(icdCode:String, _func:Function = null)
		{
			super( QIController.LOAD_ICD_CODE_EVENT);
			this.icdCode 	= icdCode;
			this.func 		= _func;
		}
	}
}