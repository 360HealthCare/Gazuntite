package com.gazuntite.document.view.event
{
	
	import com.gazuntite.document.dto.DocomentDTO;
	
	import flash.events.Event;
	
	public class DocomentPreviewEvent extends Event
	{
		public static const DOCOMENT_EVENT:String = 'DocomentViewEvent';
		public var DocomentDto:DocomentDTO;
		
		public function DocomentPreviewEvent(type:String , dto:DocomentDTO , bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			DocomentDto = dto;
		}
	}
}