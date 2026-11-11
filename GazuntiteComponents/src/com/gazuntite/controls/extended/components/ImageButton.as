package com.gazuntite.controls.extended.components
{
	import flash.utils.ByteArray;
	
	import spark.components.Image;
	import spark.components.ToggleButton;
	
	public class ImageButton extends ToggleButton
	{
		private var _Source:ByteArray;
		
		public function ImageButton()
		{
			super();
		}
		
		[Bindable]
		public function get Source():ByteArray
		{
			return _Source;
		}

		public function set Source(value:ByteArray):void
		{
			_Source = value;
		}

	}
}