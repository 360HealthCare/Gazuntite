package com.gazuntite.skins
{
	/*import mobile.dri.skins.i160.SpinnerListContainerSelectionIndicator;
	import mobile.dri.skins.i240.SpinnerListContainerSelectionIndicator;
	import mobile.dri.skins.i320.SpinnerListContainerSelectionIndicator;*/
	
	import mx.core.DPIClassification;
	
	import spark.core.SpriteVisualElement;
	import spark.skins.mobile.SpinnerListContainerSkin;
	import spark.skins.mobile.supportClasses.MobileSkin;
	import spark.skins.mobile160.assets.SpinnerListContainerBackground;
	import spark.skins.mobile160.assets.SpinnerListContainerSelectionIndicator;
	import spark.skins.mobile160.assets.SpinnerListContainerShadow;
	import spark.skins.mobile240.assets.SpinnerListContainerBackground;
	import spark.skins.mobile240.assets.SpinnerListContainerSelectionIndicator;
	import spark.skins.mobile240.assets.SpinnerListContainerShadow;
	import spark.skins.mobile320.assets.SpinnerListContainerBackground;
	import spark.skins.mobile320.assets.SpinnerListContainerSelectionIndicator;
	import spark.skins.mobile320.assets.SpinnerListContainerShadow;
	
	public class SpinnerIndicatorContainerSkin extends SpinnerListContainerSkin
	{
		public function SpinnerIndicatorContainerSkin()
		{
			super();
			switch (applicationDPI)
			{
				case DPIClassification.DPI_320:
				{
					borderClass = spark.skins.mobile320.assets.SpinnerListContainerBackground;
					//is of type class,create 320 class SpriteVisualElement	
					selectionIndicatorClass = com.gazuntite.skins.SpinnerListContainerSelectionIndicator;//mobile.dri.skins.i320.SpinnerListContainerSelectionIndicator;
					shadowClass = spark.skins.mobile320.assets.SpinnerListContainerShadow;
					
					cornerRadius = 10;
					borderThickness = 2;
					selectionIndicatorHeight = 120; // was 120
					//selectionIndicatorHeight = 120;
					break;
				}
				case DPIClassification.DPI_240:
				{
					borderClass = spark.skins.mobile240.assets.SpinnerListContainerBackground;
					selectionIndicatorClass = com.gazuntite.skins.SpinnerListContainerSelectionIndicator;
					//selectionIndicatorClass = spark.skins.mobile240.assets.SpinnerListContainerSelectionIndicator;
					shadowClass = spark.skins.mobile240.assets.SpinnerListContainerShadow;
					
					cornerRadius = 8;
					borderThickness = 1;
					selectionIndicatorHeight = 90; // was 90
					//selectionIndicatorHeight = 90;
					break;
				}
				default: // default DPI_160
				{
					borderClass = spark.skins.mobile160.assets.SpinnerListContainerBackground;
					selectionIndicatorClass = com.gazuntite.skins.SpinnerListContainerSelectionIndicator;
					//selectionIndicatorClass = spark.skins.mobile160.assets.SpinnerListContainerSelectionIndicator;
					shadowClass = spark.skins.mobile160.assets.SpinnerListContainerShadow;
					
					cornerRadius = 5;
					borderThickness = 1;
					selectionIndicatorHeight = 60; // was 60
					//selectionIndicatorHeight = 60;
					break;
				}
			}
		}
	}
}
