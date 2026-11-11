package com.gazuntite.controls.extended.components
{	
	import spark.components.ToggleButton;

	[Bindable]
	public class MultiLabelToggleButton extends ToggleButton
	{
		
		private var _lbl:String				
				
		public function MultiLabelToggleButton()
		{
			super();
		//	this.setStyle("skinClass", comboBoxRegisterationSkin);
			
		}
		
		
		public function get lbl():String
		{
			return _lbl;
		}

		public function set lbl(value:String):void
		{
			_lbl = value;
		}

	}
}