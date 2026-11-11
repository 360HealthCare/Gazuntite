package com.gazuntite.input.event.visit.physical.cchpi
{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	import com.gazuntite.input.utils.QIUtilityFunctions;
	
	public class LoadHPIStaticDataEvent extends CairngormEvent 
	{
		
		public var sectionId:int;
		public var sectionName:String;
		public var searchString:String;
		
		public function LoadHPIStaticDataEvent(sectionName:String,searchString:String ) 
		{
			super( QIController.LOAD_HPI_STATIC_DATA_EVENT);
			this.sectionId = QIUtilityFunctions.getHPIDetailTypeIdByName(sectionName);
			this.sectionName = sectionName;
			this.searchString = searchString;
		}
	}
}