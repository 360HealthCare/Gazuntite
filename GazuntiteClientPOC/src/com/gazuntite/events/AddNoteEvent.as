package com.gazuntite.events
{
	import com.gazuntite.services.valueObjects.Notes.NotesDTO;
	
	import flash.events.Event;

	public class AddNoteEvent extends Event
	{
		//public var noteSubject:String;
		//public var noteMessage:String;
		//public var id_constant:String;
		
		public var note:NotesDTO = new NotesDTO();
		
		public static const Add_Note:String = "addNoteEvent";
		
		public var full:Boolean = false;
		
		public function AddNoteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  AddNoteEvent(Add_Note);
		}
		
		
	}
}