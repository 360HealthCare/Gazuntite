package com.gazuntite.controls.extended.components
{
	
	import com.gazuntite.controls.extended.skins.LabelTextInputRequiredSkin;
	import com.gazuntite.controls.extended.skins.LabelTextInputSkin;
	
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import spark.components.Label;
	import spark.components.TextInput;
	
	public class LabelTextInput extends TextInput
	{
		//--------------------------------------------------------------------------
		//
		//    Constructor
		//
		//--------------------------------------------------------------------------
		
		private var _required:Boolean = false;
		
		public function LabelTextInput()
		{
			super();
			
			
			if(required)
			{
				setStyle("skinClass", LabelTextInputRequiredSkin);
			}
			else
			{
				setStyle("skinClass", LabelTextInputSkin);
			}
		}
		
		public override function set text(value:String):void
		{
			super.text = value;
			trace(id,value);
		}
		public function get required():Boolean
		{
			return _required;
		}
		
		public function set required(value:Boolean):void
		{
			_required = value;
			if(value)
			{
				setStyle("skinClass", LabelTextInputRequiredSkin);
			}
			else
			{
				setStyle("skinClass", LabelTextInputSkin);
			}
		}
	}
}