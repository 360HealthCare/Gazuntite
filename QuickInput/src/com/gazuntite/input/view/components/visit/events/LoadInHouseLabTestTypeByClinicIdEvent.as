package com.gazuntite.input.view.components.visit.events 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadInHouseLabTestTypeByClinicIdEvent extends CairngormEvent
	{
		public var searchTerm:String;
		public var searchType:int;
		public var func:Function;
		
		public function LoadInHouseLabTestTypeByClinicIdEvent(_searchTerm:String, _searchType:int, _func:Function = null) 
		{
			super (QIController.LOAD_LABIN_STATIC_DATA_EVENT);
			
			searchTerm = _searchTerm;
			searchType = _searchType;
			this.func = _func;
		}
	}
}