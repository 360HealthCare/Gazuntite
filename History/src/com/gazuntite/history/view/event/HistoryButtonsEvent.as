package com.gazuntite.history.view.event
{
	import com.gazuntite.history.view.itemRenderer.IHistoryIR;
	
	import flash.events.Event;
	
	import spark.components.IItemRenderer;
	
	public class HistoryButtonsEvent extends Event
	{
		
		public static const DocomentPreviewClicked:String				= 'PreviewClick';
		public static const NotesButtonClicked:String					= 'NotesClick';
		public static const DictationButtonClicked:String				= 'DictationClick';
		
		public var DTOdata:Object;
		public var ItemRenderer:IHistoryIR;
		
		public function HistoryButtonsEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}