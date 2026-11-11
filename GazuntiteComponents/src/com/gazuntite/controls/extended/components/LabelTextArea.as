package com.gazuntite.controls.extended.components
{
	import com.gazuntite.controls.extended.skins.LabelTextAreaSkin;
	
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import spark.components.Label;
	import spark.components.TextArea;
	
	public class LabelTextArea extends TextArea
	{
		[SkinPart(required="true")]
		
		public var promptView:Label;
		
		private var _prompt:String;
		private var _promptChanged:Boolean;
		
		public function LabelTextArea()
		{
			super();
			this.setStyle("skinClass", LabelTextAreaSkin)
		}

		[Bindable]
		public override function get prompt():String
		{
			return _prompt;
		}

		public function set prompt(value:String):void
		{
			if (value != _prompt)
			{
				_prompt = value;
				_promptChanged = true;
				
				invalidateProperties();
			}
		}
		[Bindable]
		override public function set text(value:String):void
		{
			super.text = value;
			
			if (promptView)
			{
				if (text == "")
					promptView.visible = true;
				
				else
					promptView.visible = false;
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_promptChanged && promptView)
			{
				promptView.text = prompt;
				
				if (text != "")
					promptView.visible = false;
				
				_promptChanged = false;
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == textDisplay)
			{
				textDisplay.addEventListener(FocusEvent.FOCUS_IN, onFocusInHandler);
				textDisplay.addEventListener(FocusEvent.FOCUS_OUT, onFocusOutHandler);
			}
			
			if (instance == promptView)
			{	
				promptView.text = prompt;
				promptView.addEventListener(MouseEvent.CLICK, onPromptClick);
				toolTip = prompt;
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == this.textDisplay)
			{
				//this.textDisplay.removeEventListener(FocusEvent.FOCUS_IN, onFocusInHandler);
				//this.textDisplay.removeEventListener(FocusEvent.FOCUS_OUT, onFocusOutHandler);
			}
		}
		
		private function onFocusInHandler(event:FocusEvent):void
		{
			if (promptView)
			{
				promptView.visible = false;
			}
			selectRange(0,text.length);
		}
		
		private function onFocusOutHandler(event:FocusEvent):void
		{
			if (promptView)
			{
				if (text == "")
				{
					promptView.visible = true;	
				}
				else
				{
					promptView.visible = false;
				}
			}
		}
		
		
		private function onPromptClick(event:MouseEvent):void
		{
			promptView.visible = false;
		}
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			if(focusManager != null) {
				super.focusInHandler(event);
			}
		}

	}
}