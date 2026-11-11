package com.gazuntite.patient.visit.view.events
{
	import mx.charts.AreaChart;
	import mx.collections.ArrayCollection;
	import mx.validators.Validator;

	[Bindable]
	public class HPIFieldsVO
	{
		
		private var _label:String;
		private var _value:Object;
		private var _itemEditor:Class;
		private var _validator:Validator;
		private var _dataProvider:ArrayCollection;
		
		public function HPIFieldsVO(arg_label:String = "", arg_value:Object = null, arg_itemEditor:Class = null, arg_validators:Validator = null, arg_dataProvider:ArrayCollection = null)
		{
			_label = arg_label;
			_value = arg_value;
			_itemEditor = arg_itemEditor;
			_validator = arg_validators;
			_dataProvider = arg_dataProvider;
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			_label = value;
		}

		public function get value():Object
		{
			return _value;
		}

		public function set value(value:Object):void
		{
			_value = value;
		}

		public function get itemEditor():Class
		{
			return _itemEditor;
		}

		public function set itemEditor(value:Class):void
		{
			_itemEditor = value;
		}

		public function get validator():Validator
		{
			return _validator;
		}
		
		public function set validator(value:Validator):void
		{
			_validator = value;
		}

		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}

		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
		}

		
	}
}