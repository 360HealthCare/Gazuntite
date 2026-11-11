package event
{
	import flash.events.Event;
	
	public class VideoChatControlEvent extends Event
	{
		public static const END_VIDEO_CHAT:String = "END_VIDEO_CHAT";
		public function VideoChatControlEvent(type:String)
		{
			super(type, false, false);
		}
	}
}