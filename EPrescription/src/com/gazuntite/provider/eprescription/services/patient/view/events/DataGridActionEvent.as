package com.gazuntite.provider.eprescription.services.patient.view.events
{
	import flash.events.Event;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class DataGridActionEvent extends Event
	{
		
		public static const EDIT_RECORD_CLICK:String 	= "dataGridEditRecordClick";
		public static const DELETE_RECORD_CLICK:String 	= "dataGridDeleteRecordClick";
		public static const ITEM_EDIT_KEY_UP:String 	= "dataGridItemEditKeyUp";
		public var searchString:String;
		public var charCode:uint;
		public var clickPoint:Point;
		public var data:Object;
		public var labelFiled;		
		
		public function DataGridActionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var ev:DataGridActionEvent = new DataGridActionEvent(type, bubbles, cancelable);
			ev.searchString = this.searchString;
			ev.clickPoint = this.clickPoint;
			ev.labelFiled = this.labelFiled;
			
			return ev;
		}
	}
}