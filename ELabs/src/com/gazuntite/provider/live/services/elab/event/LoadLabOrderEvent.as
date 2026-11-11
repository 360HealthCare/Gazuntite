/**
 * Author: Ayesha Manzoor
 * LoadLabOrderEvent would be dispatched from ELabsOrderGridView, when user loads all lab orders or performs a
 * simple Lab order search and advance lab order search.
 * The purpose to write this event is to merge three different calls in one call.
 * there would a property in xml LoadType which would distinguish among three services.
 * */
package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;

	public class LoadLabOrderEvent extends CairngormEvent
	{
		public function LoadLabOrderEvent()
		{
			super(ELabsController.LOAD_LAB_ORDER_EVENT);
		}
	}
}