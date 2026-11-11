package com.gazuntite.common.view.events
{	
	import flash.events.Event;
	import flash.text.StaticText;
	
	public class QSViewStateEvent extends Event
	{
		
		public static var COLLAPSED_VIEW  :String	= "collapsed";
		public static var EXPANDED_VIEW   :String	= "expanded";
		public static var VIEW_SLIDE_OUT  :String	= "slideOut";
		public static var VIEW_SLIDE_IN   :String	= "slideIn";
		public static var IN_FRONT_VIEW   :String	= "inFront";
		
		public static const QS_VIEW_STATE_CHANGE:String 				= "QSViewStateChange";
		
		
		public var viewState:String;
		
		public function QSViewStateEvent( type:String , viewState:String)
		{
			super( type, bubbles, cancelable);
			this.viewState = viewState;
		}
	}
}