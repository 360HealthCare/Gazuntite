package com.gazuntite.skins
{
	import mx.core.DPIClassification;
	
	import spark.components.ContentBackgroundAppearance;
	import spark.skins.mobile.CalloutSkin;
	
	public class BlueCalloutSkin extends spark.skins.mobile.CalloutSkin
	{
		public function BlueCalloutSkin()
		{
			super();
			
			// assuming a 160 DPI for simplicity
			dropShadowVisible = true;
			useBackgroundGradient = true;
			contentCornerRadius = 8;
			//contentBackgroundInsetClass = null;
			backgroundCornerRadius = 8;
			frameThickness = 50;
			borderColor = 0x000000;
			borderThickness = 1;
			arrowHeight = 15;
			//arrowWidth = 10;
		}
		
		override protected function createChildren():void
		{
			
			// create arrow first, super will skip default arrow creation 
			arrow = new  CalloutArrow();
			arrow.id = "arrow";
			arrow.styleName = this;
			
			// call super
			super.createChildren();
			
			// add arrow above all other children
			addChild(arrow);
		}
	}
}