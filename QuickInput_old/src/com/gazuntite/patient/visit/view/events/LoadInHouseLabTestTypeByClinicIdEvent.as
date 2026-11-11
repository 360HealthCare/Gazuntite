package com.gazuntite.patient.visit.view.events {

	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadInHouseLabTestTypeByClinicIdEvent extends CairngormEvent {
		
		public var searchValue :String ;
		
		public var func:Function;
		
		public function LoadInHouseLabTestTypeByClinicIdEvent(searchTerm:String, _func:Function = null) {
			super ( QIController.LOAD_LABIN_STATIC_DATA_EVENT); //QIController.LOAD_IN_HOUSE_LAB_TEST_TYPE_BY_CLINIC_ID_EVENT);
			this.func 		= _func;
			searchValue		=		searchTerm ;
			}
		}
	}