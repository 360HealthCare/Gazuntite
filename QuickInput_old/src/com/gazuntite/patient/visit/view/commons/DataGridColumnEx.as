package com.gazuntite.patient.visit.view.commons
{
	import mx.controls.dataGridClasses.DataGridColumn;
	
	public class DataGridColumnEx extends DataGridColumn
	{
		private var _property:String;
		private var _section:String;
		
		private var _data:Object;
		
		public function DataGridColumnEx(columnName:String=null)
		{
			super(columnName);
			sortable = false;
		}

		public function get property():String
		{
			return _property;
		}

		public function set property(value:String):void
		{
			_property = value;
		}

		public function get section():String
		{
			return _section;
		}

		public function set section(value:String):void
		{
			_section = value;
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

	}
}