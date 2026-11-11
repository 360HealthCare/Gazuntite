package com.gazuntite.skins.controls.list
{
	import spark.skins.spark.DefaultItemRenderer;
	
	public class PatientSortBarDropListSkinItemRenderer extends DefaultItemRenderer
	{
		public function PatientSortBarDropListSkinItemRenderer()
		{
			super();
		}
		public override function set label(value:String):void
		{
			super.label = value;
			if (labelDisplay)
			{
				labelDisplay.setStyle("fontFamily", "CalibriCFF");
				labelDisplay.setStyle("fontSize", "14");
				labelDisplay.buttonMode = true;
				labelDisplay.useHandCursor = true;
			}
			
		}
	}
}