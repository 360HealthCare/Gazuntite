package com.gazuntite.patient.visit.event.assessment.treatment.procedure
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadCPTMedicalTypesEvent extends CairngormEvent 
	{
		
		public var cptName:String	;
		/*public var reqFrom:int;*/
		public var func:Function;
		
		public function LoadCPTMedicalTypesEvent(cptName:String,/*reqFrom:int,*/_func:Function = null) 
		{
			super( QIController.LOAD_CPT_MEDICAL_TYPES_EVENT);
			this.cptName = cptName;
			/*this.reqFrom = reqFrom;int*/
			this.func 		= _func;
		}
	
	}
}