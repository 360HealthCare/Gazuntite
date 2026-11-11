package com.gazuntite.controls.extended.components
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	
	import mx.core.FlexGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.core.IVisualElementContainer;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.managers.IFocusManagerContainer;
	import mx.managers.PopUpManager;
	
	import spark.components.Group;
	
	
	
	public class PopupGroup extends Group implements IFocusManagerContainer
	{
		private var _displayPopUp:Boolean;
		private var _defaultButton:IFlexDisplayObject;
		public function PopupGroup()
		{
			super();
			
			this.addEventListener(CloseEvent.CLOSE, function (event:Event):void
			{
				if( isPopUp )
					close();
				//stop cascading events from triggering
				/*event.stopImmediatePropagation();
				event.preventDefault();*/
			});
			
		}
		
		public function get displayPopUp():Boolean
		{
			return _displayPopUp;
		}

		public function set displayPopUp(value:Boolean):void
		{
			_displayPopUp = value;
		}

		public function ShowPopup(parent:DisplayObject):void
		{
			PopUpManager.addPopUp( this, parent );
		}
		
		public function removePopup():void
		{
			dispatchEvent( new Event( CloseEvent.CLOSE, true, false ) );
		}
		
		private function close():void
		{
			PopUpManager.removePopUp( this );
		}
		
		
		//IFocusManagerContainer impl
		
		public function set defaultButton(value:IFlexDisplayObject):void
		{
			_defaultButton = value;
		}

		public function get defaultButton():IFlexDisplayObject
		{
			return _defaultButton;
		}

	}
}