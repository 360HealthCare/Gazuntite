package com.zigron.gazuntite.model.valueObjects.Plan
{	
	import org.spicefactory.lib.reflect.types.Private;

	[Bindable]
	public class RecommendationDTO
	{
		private var _selectionPlan:String;
		private var _assosiatedDignosis:String;
		private var _method:String;
		private var _Duration:String;
		
		public function RecommendationDTO()
		{
		}

		public function get Duration():String
		{
			return _Duration;
		}

		public function set Duration(value:String):void
		{
			_Duration = value;
		}

		public function get method():String
		{
			return _method;
		}

		public function set method(value:String):void
		{
			_method = value;
		}

		public function get assosiatedDignosis():String
		{
			return _assosiatedDignosis;
		}

		public function set assosiatedDignosis(value:String):void
		{
			_assosiatedDignosis = value;
		}

		public function get selectionPlan():String
		{
			return _selectionPlan;
		}

		public function set selectionPlan(value:String):void
		{
			_selectionPlan = value;
		}

	}
}