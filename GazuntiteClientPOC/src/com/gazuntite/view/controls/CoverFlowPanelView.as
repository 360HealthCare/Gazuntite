package com.gazuntite.view.controls
{
	import com.gazuntite.events.OptionsButtonClickedEvent;
	
	import flash.events.MouseEvent;
	
	import mx.events.CloseEvent;
	
	import spark.components.Button;
	import spark.components.Panel;
	
	[Event(name="optionsButtonClicked", type="com.gazuntite.events.OptionsButtonClickedEvent")]
	public class CoverFlowPanelView extends Panel
	{
		[SkinPart(required="true")]
		public var options:Button;
		
		public function CoverFlowPanelView()
		{
			super();
			this.addEventListener(CloseEvent.CLOSE, handleClose);
			this.creationPolicy = "all";
		}
		
		protected function handleClose(event:CloseEvent):void
		{
			controlBarVisible = false;
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == options)
			{
				//options.addEventListener(MouseEvent.CLICK, optionsClose);
				options.addEventListener(OptionsButtonClickedEvent.OPTIONS_BUTTON_CLICKED, optionsClickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == options)
			{
				options.removeEventListener(MouseEvent.CLICK, optionsClickHandler);
			}
		}
		
		/*protected function optionsClose(event:MouseEvent):void
		{
			controlBarVisible = false;
		}*/
		
		protected function optionsClickHandler(event:OptionsButtonClickedEvent):void
		{
			//dispatchEvent(new OptionsButtonClickedEvent(OptionsButtonClickedEvent.OPTIONS_BUTTON_CLICKED));
			
			// toggle the control bar
			if(controlBarVisible)
			{
				//controlBarVisible = false;
			}else
			{
				controlBarVisible = true;
			}
			
			
		}
		
		
		
	}
}