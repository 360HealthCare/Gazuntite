package com.gazuntite.provider.live.services.scheduler.view.event
{
	import flash.events.Event;
	
	public class ActionEvent extends Event
	{
		public var current_action:String;
		public function ActionEvent(type:String, _current_action:String)
		{
			super(type, true);
			this.current_action = _current_action;
		}
	}
}