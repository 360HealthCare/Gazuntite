package com.gazuntite.provider.services.email.view.event
{
	import flash.events.Event;

	public class RefreshInboxPanel extends Event
	{
		public static const REFRESH_MAIL_PANEL_EVENT:String = "RefreshEmailEvent";
		public function RefreshInboxPanel()
		{
			super(REFRESH_MAIL_PANEL_EVENT, true, false);
		}
	}
}