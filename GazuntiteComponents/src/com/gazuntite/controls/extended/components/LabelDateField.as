package com.gazuntite.controls.extended.components
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.external.ExternalInterface;
	
	import mx.controls.DateField;
	
	public class LabelDateField extends DateField
	{
		private var _textIsEmpty: Boolean = true;
		private var m_bIsEditAllow: Boolean = true;
		private var _label: String;
		
		public function LabelDateField()
		{
		}
		
		
		/**
		 * The label to display when the text field is empty.
		 */
		public function get label(): String {
			return _label;
		}
		
		public function set label(value: String): void {
			_label = value;
			toolTip = value;
			updateContents();
		}
		/**
		 * The label to display when the text field is empty.
		 */
		public function get prompt():String
		{
			return _label;
		}
		
		public function set prompt(value:String):void
		{
			_label = value;
			toolTip = value;
			updateContents();
		}
		
		
		[Bindable]
		override public function get text(): String {
			if (_textIsEmpty) {
				return "";
			}
			else {
				return super.text;
			}
		}
		
		override public function set text(value: String): void {
			if (value == "") {
				_textIsEmpty = true;
			}
			else {
				_textIsEmpty = false;
				super.text = value;
			}
			updateContents();
		}
		
		private function updateContents(): void {
			if (_textIsEmpty) {
				setStyle("color", 0x333333);
				super.text = _label;
			}
			else {
				setStyle("color", 0x333333);
			}
		}
		
		
		private function handleTextChange(event: Event): void {
			if (super.text == "") {
				_textIsEmpty = true;
			}
			else {
				_textIsEmpty = false;
			}
		}
		
		private function handleFocusIn(event: FocusEvent): void {
			if (_textIsEmpty) {
				super.text = "";
				setStyle("color", 0x333333);
			}
		}
		
		private function handleFocusOut(event: FocusEvent): void {
			if(super.text.length >0){
				_textIsEmpty = false;
			}else{
				_textIsEmpty = true;
			}
			updateContents();
		}
		
		override public function initialize(): void {
			super.initialize();
			addEventListener(Event.CHANGE, handleTextChange);
			addEventListener(FocusEvent.FOCUS_IN, handleFocusIn);
			addEventListener(FocusEvent.FOCUS_OUT, handleFocusOut);
			updateContents();
			
			textInput.maxChars = 200;
		}
		override protected function createChildren():void
		{
			super.createChildren();
			//editable = true; old imp
			editable = IsEditAllow;
		}
		
		override public function set selectedDate(value:Date):void
		{
			super.selectedDate = value;
			_textIsEmpty = false;
		}

		public function get IsEditAllow():Boolean
		{
			return m_bIsEditAllow;
		}

		public function set IsEditAllow(value:Boolean):void
		{
			m_bIsEditAllow = value;
		}

	}
	
}