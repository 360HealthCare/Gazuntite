package com.gazuntite.events
{
	import flash.events.Event;
	
	public class DisplayNotesAndDictationEvent extends Event
	{
		public static const DISPLAY_NOTES_DICTATION:String = "displayNotesDictation";
		
		public var noteTxt:String;
		public var dictationPath:String;
		
		public function DisplayNotesAndDictationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(DISPLAY_NOTES_DICTATION, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  DisplayNotesAndDictationEvent(DISPLAY_NOTES_DICTATION);
		}
	}
}