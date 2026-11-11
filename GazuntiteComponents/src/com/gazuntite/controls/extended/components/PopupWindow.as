package com.gazuntite.controls.extended.components
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.TitleWindow;
	
	
	[Event(name="closing", type="flash.events.Event")]
	
	public class PopupWindow extends TitleWindow
	{
		public function PopupWindow()
		{
			super();
			
			this.addEventListener(CloseEvent.CLOSE, function (event:CloseEvent):void
			{
				dispatchEvent( new Event( Event.CLOSING, true, false ) );
				if( isPopUp )
					removePopup();
			});
		}
		
		public function ShowPopup(parent:DisplayObject, modal:Boolean = false):void
		{
			if( isPopUp ) return;//already showing popup
			PopUpManager.addPopUp( this, parent, modal );
			PopUpManager.centerPopUp( this );
		}
	
		
		public function removePopup():void
		{
			//Flex sdk bug here /// https://bugs.adobe.com/jira/browse/SDK-29522
			// Another manual way to do is to do a focusManager.deactivate(); on all controls that can have focus before removing them from stage.
			focusManager.deactivate(); 
			if( isPopUp )
				PopUpManager.removePopUp( this );
		}
	}
}