package com.gazuntite.document.view.event
{
	import com.gazuntite.document.dto.DocomentDTO;
	import com.gazuntite.document.dto.DocomentSearchedDTO;
	
	import flash.events.Event;
	
	public class DocomentListEvent extends Event
	{
		
		public static const  DOCOMENT_LIST_CLICKED:String = 'DocumentListClick';
		public var Docomentdto:DocomentSearchedDTO;
		
		public function DocomentListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}