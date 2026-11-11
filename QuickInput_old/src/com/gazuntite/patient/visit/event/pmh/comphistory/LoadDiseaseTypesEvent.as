package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadDiseaseTypesEvent extends CairngormEvent
	{
		public var typeId:int;
		public static const HEART_DISEASE:int = 2;
		public static const HYPERTENSTION:int = 3;
		public static const DIABTESASE:int = 4;
		public static const CANCER:int = 5;
		public static const OTHER:int = 6;

		public function LoadDiseaseTypesEvent(typeId:int)
		{
			super(QIController.LOAD_DISEASE_TYPE_EVENT);
			this.typeId = typeId;
		}
	}
}