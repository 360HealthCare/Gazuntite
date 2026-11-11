package com.gazuntite.viewModel
{
	[Bindable]
	public class PatientDictationNoteViewModel
	{
		private var _visible:Boolean = false;

		public function get visible():Boolean
		{
			return _visible;
		}

		public function set visible(value:Boolean):void
		{
			_visible = value;
			if (!visible)
			{
				inDictationMode = false;
				inNoteMode = false;
			}
		}

		public var inlineEditing:Boolean = false;
		
		private var _inDictationMode:Boolean = false;

		public function get inDictationMode():Boolean
		{
			return _inDictationMode;
		}

		public function set inDictationMode(value:Boolean):void
		{
			_inDictationMode = value;
			if (_inDictationMode)
			{
				visible = true;
				inNoteMode = false;
			}
			if (!inDictationMode && !inNoteMode && inlineEditing)
			{
				visible = false;
			}
		}

		private var _inNoteMode:Boolean = false;

		public function get inNoteMode():Boolean
		{
			return _inNoteMode;
		}

		public function set inNoteMode(value:Boolean):void
		{
			_inNoteMode = value;
			if (_inNoteMode)
			{
				visible = true;
				inDictationMode = false;
			}
			if (!inDictationMode && !inNoteMode && inlineEditing)
			{
				visible = false;
			}
		}

		public function PatientDictationNoteViewModel()
		{
		}
	}
}