package com.gazuntite.skins
	// components\mobile\skins\MyToggleSwitchSkin.as
{
	import spark.skins.mobile.ToggleSwitchSkin;
	
	public class MyToggleSwitchSkin extends ToggleSwitchSkin
	{
		public function MyToggleSwitchSkin()
		{
			super();
			// Set properties to define the labels 
			// for the selected and unselected positions.
			selectedLabel="Yes";
			unselectedLabel="No";
		}
	}
}