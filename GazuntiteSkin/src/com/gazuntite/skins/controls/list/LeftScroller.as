package com.gazuntite.skins.controls.list
{
	import spark.components.Scroller;
	
	public class LeftScroller extends Scroller
	{
		public function LeftScroller()
		{
			super();
		}
		
		protected override function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
		{
			super.updateDisplayList( unscaledWidth, unscaledHeight );
			
			if( verticalScrollBar && verticalScrollBar.visible )
			{
				verticalScrollBar.x = -verticalScrollBar.width-10;
			}
		}

	}
}