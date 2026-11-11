package qs.ipeControls.classes
{
	import spark.components.Label;
	
	// this class works around a bug in Beta3. The bug has been fixed in latest builds, so this class would be unnecessary.
	public class CorrectText extends Label
	{
		override protected function measure():void
		{
			super.measure();
			invalidateDisplayList();
		}
	}
}