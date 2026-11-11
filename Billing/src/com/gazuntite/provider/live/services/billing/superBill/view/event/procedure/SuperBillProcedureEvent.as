package com.gazuntite.provider.live.services.billing.superBill.view.event.procedure
{
	import com.gazuntite.common.dto.typeDTO.CPTMedicalTypeDTO;
	
	import flash.events.Event;

	public class SuperBillProcedureEvent extends Event
	{
		public static const SUPER_BILL_PROCEDURE_ITEM_KEY_UP_EVENT:String = "SuperBillInputProcedureItemKeyUp";
		public static const SUPER_BILL_PROCEDURE_ADD_EVENT:String = "SuperBillInputProcedureAdd";
		public static const SUPER_BILL_PROCEDURE_DELETE_EVENT:String = "SuperBillInputProcedureDelete";
		public static const SUPER_BILL_PROCEDURE_EDIT_EVENT:String = "SuperBillInputProcedureEdit";
		
		public var searchString:String;
		public var searchType:int;
		public var procedureDTO:CPTMedicalTypeDTO;
		
		public function SuperBillProcedureEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);			
		}
	}
}