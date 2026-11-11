package com.gazuntite.view.controls
{
	import com.gazuntite.events.ClearTextInputEvent;
	
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.TextInput;
	import spark.primitives.BitmapImage;
	
	[Event(name="clearTextInput", type="com.gazuntite.events.ClearTextInputEvent")]
	public class TextInputIcon extends TextInput
	{
		[SkinPart(required="true")]
		public var icon:BitmapImage;
		
		[SkinPart(required="true")]
		public var closeBtn:Button;
		
		protected var _iconPath:String;
		
		public function TextInputIcon()
		{
			super();
		}

		[Bindable]
		public function get iconPath():String
		{
			return _iconPath;
		}

		public function set iconPath(value:String):void
		{
			_iconPath = value;
			if(icon != null)
			{
				icon.source = _iconPath;
			}
			
		}

		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == closeBtn)
			{
				closeBtn.addEventListener(MouseEvent.CLICK, closeClickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == closeBtn)
			{
				closeBtn.removeEventListener(MouseEvent.CLICK, closeClickHandler);
			}
		}
		
		protected function closeClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new ClearTextInputEvent(ClearTextInputEvent.CLEAR_TEXT_INPUT));
		}
		
		
		
		
		
	}
}