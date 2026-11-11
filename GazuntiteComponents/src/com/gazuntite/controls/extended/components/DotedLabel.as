package com.gazuntite.controls.extended.components
{
	import spark.components.Label;
	
	public class DotedLabel extends Label
	{
		private var m_iDesiredLength:int;
		
		public function DotedLabel()
		{
			super();
		}
		
		public function get DesiredLength():int
		{
			return m_iDesiredLength;
		}

		public function set DesiredLength(value:int):void
		{
			m_iDesiredLength = value;
		}

		public override function get text():String
		{
			var lbl:String = super.text;
			if( lbl && lbl.length > DesiredLength )
			{
				lbl = lbl.substring( 0, DesiredLength - 3 ) + "...";
			}
			//trace("doted text", lbl)
			return lbl;
		}
	}
}