package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;

	public class LoadEncounterTypesEvent extends CairngormEvent
	{
		public var callBack:Function;
		public function LoadEncounterTypesEvent(callBack:Function)
		{
			super( QSCommonController.LOAD_ENCOUNTER_TYPES_EVENT);
			this.callBack = callBack;
		}
	}
}