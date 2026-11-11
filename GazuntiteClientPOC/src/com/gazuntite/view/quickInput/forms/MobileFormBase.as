package com.gazuntite.view.quickInput.forms
{
	import flash.events.MouseEvent;
	
	import spark.components.Group;

	public class MobileFormBase extends Group
	{
		public function MobileFormBase()
		{
		}
		
		import com.gazuntite.events.SaveFormDataEvent;
		import com.gazuntite.model.SharedModel;
		
		import mx.events.FlexEvent;
		import mx.utils.ObjectProxy;
		
		
		[Bindable]
		protected var _buttonLabel:String;
		
		[Bindable]
		protected var _isEditForm:Boolean = false;
		
		[Bindable]
		protected var _didEdit:Boolean = false;
		
		[Bindable]
		protected var _showButton:Boolean = true;
		
		[Bindable]
		protected var _selectedRecord:Object;
		
		[Bindable]
		public var sharedModel:SharedModel;
		
		
		public function get showButton():Boolean
		{
			return _showButton;
		}

		public function set showButton(value:Boolean):void
		{
			_showButton = value;
		}

		public function get isEditForm():Boolean
		{
			return _isEditForm;
		}
		
		public function set isEditForm(value:Boolean):void
		{
			_isEditForm = value;
		}
		
		public function get buttonLabel():String
		{
			return _buttonLabel;
		}
		
		public function set buttonLabel(value:String):void
		{
			_buttonLabel = value;
		}
		
	/*	
		protected function clearForm():void{}
		protected function setForm():void{}
		protected function updateRecord():void{}
		protected function validateEditForm():void{}*/
		
	}
}