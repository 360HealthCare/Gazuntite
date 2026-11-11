package com.gazuntite.patient.visit.event.pmh.immunization
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadImmunicationStaticDataEvent extends CairngormEvent
	{
		public var searchCritera:String, subSectionName:String;
		
		public function LoadImmunicationStaticDataEvent(searchCritera:String, subSectionName:String)
		{
			super(QIController.LOAD_IMMUNICATION_STATIC_DATA);
			
			this.searchCritera = searchCritera;
			this.subSectionName = subSectionName;
		}
	}
}