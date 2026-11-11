/**
 * Author: Ayesha Manzoor
 * LoadLabResultEvent would be dispatched from ELabsResultGridView, when user loads all lab results or performs a
 * simple Lab result search and advance lab result search.
 * The purpose to write this event is to merge three different calls in one call.
 * there would a property in xml LoadType which would distinguish among three services.
 * */
package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;

	public class LoadLabResultEvent extends CairngormEvent
	{
		public function LoadLabResultEvent()
		{
			super(ELabsController.LOAD_LAB_RESULT_EVENT);
		}
	}
}