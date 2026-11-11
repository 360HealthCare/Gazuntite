package com.zigron.gazuntite.model.valueObjects.diagnosis
{
	import flash.events.EventDispatcher;

	[Bindable]
	public class DiagnosisDTO 
	{
		public var Chronic:String;
		public var Code:String;
		public var Description:String;
		public var AssociatedWith:String;
		public var OnSet:String;
		
		
		public function DiagnosisDTO()
		{
		}
	}
}