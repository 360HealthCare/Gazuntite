package com.gazuntite.controls.extended.components
{	
	import spark.components.ToggleButton;

	[Bindable]
	public class CounterToggleButton extends ToggleButton
	{
		
		private var _lbl:String				
				
		public function CounterToggleButton()
		{
			super();
		//	this.setStyle("skinClass", comboBoxRegisterationSkin);
			
		}
		
		
		public function get counter():String
		{
			return _lbl;
		}

		public function set counter(value:String):void
		{
			_lbl = value;
		}

	}
}