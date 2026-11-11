package  com.gazuntite.provider.services.email.event
{
	import flash.events.Event;

	public class EmailOptionEvent extends Event
	{		
		public static const EMAIL_OPTION_CHANGE:String="emailOptionChange";
		
		public var content:*;
		
		public function EmailOptionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}