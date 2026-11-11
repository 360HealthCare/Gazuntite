package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	import mx.collections.ArrayCollection;

	public class DeleteComprehensiveModuleDatabyPatientIDEvent  extends CairngormEvent
	{
		public var patientId:int;
		public var branchId:int;
		public var typeID:int;
		public var CH_Section:int;
		public var callBack:Function;
		
		public function DeleteComprehensiveModuleDatabyPatientIDEvent(PatientID:int, CH_Section:int, typeID:int, clinicBranchID:int, callBack:Function = null)
		{
			super( QIController.DELETE_COMPREHENSIVE_MODULE_EVENT);
			this.patientId 	= PatientID;
			this.CH_Section = CH_Section;
			this.typeID 	= typeID;
			this.branchId 	= clinicBranchID;
			this.callBack 	= callBack;
		}
	}
}